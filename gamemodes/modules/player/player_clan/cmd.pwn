CMD:createclan(playerid, params[])
{
    new clanname[128], clantag[10];

    if(PlayerData[playerid][pClan] != -1)
        return SendErrorMessage(playerid, "Kamu sudah berada di dalam clan");

    if(sscanf(params, "s[128]s[10]", clanname, clantag))
        return SendSyntaxMessage(playerid, "/createclan [clanname] [clantag]");

    if(strlen(clanname) > 128 || strlen(clantag) > 128)
        return SendSyntaxMessage(playerid, "/createclan [clanname] [clantag]");

    foreach(new i : Clan)
    {
        if(!strcmp(clantag, ClanData[i][clanTag], true))
        {
            return SendErrorMessage(playerid, "Clan tag tersebut sudah ada !");
        }
    }
    if(Clan_Create(playerid, clanname, clantag) != INVALID_CLAN_ID) SendServerMessage(playerid, "Kamu membuat clan %s dengan tag %s", clanname, clantag);
    else SendErrorMessage(playerid, "Slot clan sudah penuh dan tidak dapat di buat kembali, hubungi developer!");
    return 1;
}

CMD:clancolor(playerid, params[])
{
    new color, 
        index = Clan_ReturnIndex(playerid),
        rank = PlayerData[playerid][pClanRank]
    ;

    if(sscanf(params, "h", color))
        return SendSyntaxMessage(playerid, "/clancolor [hex color]");

    if(index == INVALID_CLAN_ID)
        return SendErrorMessage(playerid, "Kamu tidak di dalam clan manapun");

    if(rank < CLAN_RANK_VICE)
        return SendErrorMessage(playerid, "Rank kamu tidak cukup untuk mengubah warna clan");

    ClanData[index][clanColor] = color;
    SetClanColor(playerid, index);
    foreach(new i : Player)
    {
        if(PlayerData[i][pClan] == ClanData[index][clanID])
        {
            SetClanColor(i, index);
        } 
    }
    SendServerMessage(playerid, "Kamu mengubah warna clan mu!");
    return 1;
}

CMD:disbandclan(playerid, params[])
{
    if(PlayerData[playerid][pClan] != -1 && PlayerData[playerid][pClanRank] == CLAN_RANK_LEADER)
    {
        new index = Clan_ReturnIndex(playerid);
        if(index == INVALID_CLAN_ID)
            return 0;

        foreach(new i : Player)
        {
            if(PlayerData[i][pClan] == ClanData[index][clanID])
            {
                PlayerData[i][pClan] = -1;
                PlayerData[i][pClanRank] = CLAN_RANK_NONE;
                SetPlayerName(i, PlayerData[i][pUsername]);
            }
        }
        Clan_Delete(index);
        PlayerData[playerid][pClan] = -1;
        PlayerData[playerid][pClanRank] = CLAN_RANK_NONE;
        SetPlayerName(playerid, PlayerData[playerid][pUsername]);
        SendServerMessage(playerid, "Kamu membubarkan clan mu!");
    }
    return 1;
}

CMD:setrank(playerid, params[])
{
    new userid, rank;
    if(sscanf(params, "ud", userid, rank))
        return SendSyntaxMessage(playerid, "/setrank [playerid] [1-3]");

    if(userid == INVALID_PLAYER_ID)
        return SendErrorMessage(playerid, "ID yang kamu masukan tidak terhubung ke server");

    if(rank < 1 || rank > 3)
        return SendErrorMessage(playerid, "Minimal rank 1, maximal rank 3");

    if(PlayerData[userid][pClan] != PlayerData[playerid][pClan])
        return SendErrorMessage(playerid, "Player tersebut tidak di dalam clan kamu!");

    PlayerData[userid][pClanRank] = rank;
    SendClanMessage(playerid, COLOR_WHITE, "%s Telah di angkat menjadi %s oleh %s", PlayerData[userid][pUsername], GetClanRankName(rank), PlayerData[playerid][pUsername]);
    return 1;
}

CMD:kickclan(playerid, params[])
{
    new userid;
    if(sscanf(params, "u", userid))
        return SendSyntaxMessage(playerid, "/kickclan [playerid]");

    if(userid == INVALID_PLAYER_ID)
        return SendErrorMessage(playerid, "ID yang kamu masukan tidak terhubung ke server");

    PlayerData[userid][pClan] = -1;
    PlayerData[userid][pClanRank] = 0;
    SetPlayerName(userid, PlayerData[userid][pUsername]);
    return 1;
}

CMD:inviteclan(playerid, params[])
{
    new targetid, index = Clan_ReturnIndex(playerid), string[MAX_PLAYER_NAME+1];

    if(index == INVALID_CLAN_ID)
        return SendErrorMessage(playerid, "Kamu tidak di dalam clan manapun!");

    if(sscanf(params, "u", targetid))
        return SendSyntaxMessage(playerid, "/inviteclan [playerid]");

    if(targetid == INVALID_PLAYER_ID)
        return SendErrorMessage(playerid, "Player tersebut tidak terhubung ke dalam server");

    if(PlayerData[targetid][pClan] != -1)
        return SendErrorMessage(playerid, "Player tersebut sudah di dalam clan!");

    if(PlayerData[playerid][pClanRank] < CLAN_RANK_VICE)
        return SendErrorMessage(playerid, "Rank kamu tidak mencukupi untuk menggunakan perintah ini!");

    PlayerData[targetid][pClan] = PlayerData[playerid][pClan];
    PlayerData[targetid][pClanRank] = CLAN_RANK_MEMBER;
    
    format(string, sizeof(string), "[%s]%s", ClanData[index][clanTag], PlayerData[targetid][pUsername]);
    SetPlayerName(targetid, string);
    SetClanColor(targetid, index);
    SendServerMessage(playerid, "Kamu mengundang %s untuk bergabung kedalam clan %s", ReturnName(targetid), ClanData[index][clanName]);
    SendServerMessage(targetid, "Kamu di undang %s bergabung kedalam clan %s", ReturnName(playerid), ClanData[index][clanName]);
    return 1;
}

CMD:leaveclan(playerid, params[])
{
    if(PlayerData[playerid][pClan] != -1)
    {
        PlayerData[playerid][pClan] = -1;
        PlayerData[playerid][pClanRank] = 0;
        SendServerMessage(playerid, "Kamu keluar meninggalkan clan mu!");
        SetPlayerName(playerid, PlayerData[playerid][pUsername]);
    }
    return 1;
}

CMD:clanlist(playerid, params[])
{
    new string[2048];
    strcat(string, "Clan Name\tClan Tag\n");
    foreach(new i : Clan)
    {
        strcat(string, sprintf("%s\t%s\n", ClanData[i][clanName], ClanData[i][clanTag]));
    }
    Dialog_Show(playerid, ShwOnly, DIALOG_STYLE_TABLIST_HEADERS, "Clan List", string, "Close", "");
    return 1;
}