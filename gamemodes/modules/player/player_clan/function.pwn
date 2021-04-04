forward OnClanCreated(playerid, index);
public OnClanCreated(playerid, index)
{
    ClanData[index][clanID] = cache_insert_id();
    PlayerData[playerid][pClan] = ClanData[index][clanID];
    Clan_Save(index);
    return 1;
}

forward OnClanLoaded();
public OnClanLoaded()
{
    if(cache_num_rows())
    {
        for(new i = 0; i != cache_num_rows(); i++)
        {
            Iter_Add(Clan, i);

            ClanData[i][clanID] = cache_get_field_int(i, "clanID");
            ClanData[i][clanColor] = cache_get_field_int(i, "clanColor");
            cache_get_field_content(i, "clanName", ClanData[i][clanName], 128);
            cache_get_field_content(i, "clanTag", ClanData[i][clanTag], 10);
        }
    }
    return 1;
}
ClanIsExists(clanid)
{
    if(Iter_Contains(Clan, clanid))
        return 1;

    return INVALID_CLAN_ID;
}
Clan_Delete(index)
{
    if(ClanIsExists(index))
    {
        Iter_Remove(Clan, index);

        mysql_tquery(g_iHandle, sprintf("DELETE FROM `player_clan` WHERE `clanID` = '%d';", ClanData[index][clanID]));

        new tmp_ClanData[E_PLAYER_CLAN];
        ClanData[index] = tmp_ClanData;
    }
    return 0;
}
Clan_Create(playerid, clanname[], clantag[])
{
    static index;
    if((index = Iter_Free(Clan)) != cellmin)
    {
        new 
            rand = random(sizeof(RandomClan_Color)),
            newname[MAX_PLAYER_NAME+1],
            query[1024]
        ;
        Iter_Add(Clan, index);
        
        format(ClanData[index][clanName], 128, "%s", clanname);
        format(ClanData[index][clanTag], 10, "%s", clantag);
        ClanData[index][clanColor] = RandomClan_Color[rand][0];

        //Set Player name after creating it
        format(newname, sizeof(newname), "[%s]%s", clantag, PlayerData[playerid][pUsername]);
        SetPlayerName(playerid, newname);
        SetClanColor(playerid, index);

        PlayerData[playerid][pClanRank] = CLAN_RANK_LEADER;

        format(query, sizeof(query), "INSERT INTO `player_clan`(`clanName`) VALUES ('%s');", ClanData[index][clanName]);
        mysql_tquery(g_iHandle, query, "OnClanCreated", "dd", playerid, index);
        return index;
    }
    return INVALID_CLAN_ID;
}

Clan_ReturnIndex(playerid)
{
    foreach(new i : Clan)
    {
        if(PlayerData[playerid][pClan] == ClanData[i][clanID])
            return i;
    }
    return INVALID_CLAN_ID;
}

Clan_Save(index)
{
    if(ClanIsExists(index))
    {
        new query[1024];
        format(query, sizeof(query), "UPDATE `player_clan` SET `clanName` = '%s', `clanTag` = '%s', `clanColor` = '%d' WHERE `clanID` = '%d'",
        SQL_ReturnEscaped(ClanData[index][clanName]),
        SQL_ReturnEscaped(ClanData[index][clanTag]),
        ClanData[index][clanColor],
        ClanData[index][clanID]);

        mysql_tquery(g_iHandle, query);
        return 1;
    }
    return INVALID_CLAN_ID;
}

GetClanRankName(level)
{
    new name[128];
    switch(level)
    {
        case CLAN_RANK_MEMBER: name = "Member";
        case CLAN_RANK_VICE: name = "Vice";
        case CLAN_RANK_LEADER: name = "Leader";
    }
    return name;
}

SetClanColor(playerid, index)
{
    return SetPlayerColor(playerid, ClanData[index][clanColor]);
}

stock SendClanMessage(playerid, color, const str[], {Float,_}:...)
{
    static
        args,
        start,
        end,
        string[144]
    ;
    #emit LOAD.S.pri 8
    #emit STOR.pri args

    if(args > 8)
    {
        #emit ADDR.pri str
        #emit STOR.pri start

        for (end = start + (args - 8); end > start; end -= 4)
        {
            #emit LREF.pri end
            #emit PUSH.pri
        }
        #emit PUSH.S str
        #emit PUSH.C 144
        #emit PUSH.C string

        #emit LOAD.S.pri 8
        #emit ADD.C 4
        #emit PUSH.pri

        #emit SYSREQ.C format
        #emit LCTRL 5
        #emit SCTRL 4

        foreach (new i : Player)
        {
            if(PlayerData[playerid][pClan] == PlayerData[i][pClan]) {
                SendClientMessage(i, color, string);
            }
        }
        return 1;
    }
    foreach (new i : Player)
    {
        if(PlayerData[playerid][pClan] == PlayerData[i][pClan]) {
            SendClientMessage(i, color, str);
        }
    }
    return 1;
}