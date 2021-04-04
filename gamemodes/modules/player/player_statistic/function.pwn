Float:GetPlayerExp(playerid)
{
    return PlayerData[playerid][pExp];
}

SetPlayerExp(playerid, Float:amount)
{
    PlayerData[playerid][pExp] += amount;
    if(PlayerData[playerid][pExp] >= 100.0)
    {
        new level = GetPlayerLevel(playerid);
        PlayerData[playerid][pExp] = 0.0;
        SetPlayerLevel(playerid, level+1);
    }
    return 1;
}
Float:GetPlayerHeadshot(playerid)
{
    return PlayerData[playerid][pHeadshot];
}

SetPlayerHeadshot(playerid, Float:amount)
{
    PlayerData[playerid][pHeadshot] += amount;
    if(PlayerData[playerid][pHeadshot] >= 100)
    {
        PlayerData[playerid][pHeadshot] = 100;
    }
    else if(PlayerData[playerid][pHeadshot] <= 0)
    {
        PlayerData[playerid][pHeadshot] = 0;
    }
    return 1;
}

GetPlayerMMR(playerid)
{
    return PlayerData[playerid][pMMR];
}

SetPlayerMMR(playerid, amount)
{
    PlayerData[playerid][pMMR] += amount;
    if(PlayerData[playerid][pMMR] <= 0)
    {
        PlayerData[playerid][pMMR] = 0;
    }
    return 1;
}

GetPlayerLevel(playerid)
{
    return PlayerData[playerid][pScore];
}

SetPlayerLevel(playerid, score)
{
    PlayerData[playerid][pScore] = score;
    SetPlayerScore(playerid, score);
    return 1;
}

ShowPlayerStats(playerid)
{
    new 
        string[4084],
        level = GetPlayerLevel(playerid),
        Float:exp = GetPlayerExp(playerid),
        kill = PlayerData[playerid][pKill],
        death = PlayerData[playerid][pDeath],
        money = GetPlayerMoneyEx(playerid),
        Float:health = GetPlayerHealthEx(playerid),
        Float:armour = GetPlayerArmourEx(playerid),
        Float:maxhealth = GetPlayerMaxHealth(playerid),
        Float:maxarmour = GetPlayerMaxArmour(playerid),
        index,
        clantag[25],
        clanname[128]
    ;

    if((index = Clan_ReturnIndex(playerid)) != -1)
    {
        format(clantag, 25, "%s", ClanData[index][clanTag]);
        format(clanname, 25, "%s", ClanData[index][clanName]);
    }
    else
    {
        format(clantag, 25, "None");
        format(clanname, 25, "None");
    }

    format(string, sizeof(string), ""WHITE"====================================================================\n");
    format(string, sizeof(string), "%s"YELLOW"Class : "RED"%s "WHITE"|| "YELLOW"Health : "RED"[%.2f/%.2f] "WHITE"|| "YELLOW"Armour : "RED"[%.2f/%.2f] "WHITE"|| "YELLOW"Clan Tag : "RED"%s "WHITE"|| "YELLOW"Clan Name : "RED"%s\n", string, GetPlayerClassName(playerid), health, maxhealth, armour, maxarmour, clantag, clanname);
    format(string, sizeof(string), "%s"YELLOW"Experience : "RED"%.2f "WHITE"|| "YELLOW"Level :"RED"%d "WHITE"|| "YELLOW"Kill : "RED"%d"WHITE"|| "YELLOW"Death : "RED"%d "WHITE"|| "YELLOW"Money : "GREEN"$%s"WHITE"\n", string, exp, level, kill, death, FormatNumber(money));
    format(string, sizeof(string), "%s====================================================================\n", string);
    Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, ""RED"SERVER HELP", string, "Close", "");   
    return 1;
}