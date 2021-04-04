forward OnAccountChecked(playerid, race_check);
public OnAccountChecked(playerid, race_check)
{
    new string[MAX_PLAYER_NAME+1];
    if (race_check != g_MysqlRaceCheck[playerid])
        return KickEx(playerid);

    format(string, sizeof(string), "Unity Warzone - %s", ReturnName(playerid));
    Player_LoginTimer[playerid] = defer Player_ScreenTimer(playerid);
    
    if(cache_num_rows()) 
    {
        PlayerData[playerid][pID] = cache_get_field_int(0, "ID");        
        cache_get_field_content(0, "Salt", PlayerData[playerid][pSalt], 65);
        cache_get_field_content(0, "Password", PlayerData[playerid][pPassword], 65);
        cache_get_field_content(0, "IP", PlayerData[playerid][pIP], 20);

        PlayerData[playerid][pAdmin] = cache_get_field_int(0, "Admin");
        PlayerData[playerid][pRegisterDate] = cache_get_field_int(0, "RegisterDate");

        PlayerData[playerid][pScore] = cache_get_field_int(0, "Score");
        PlayerData[playerid][pExp] = cache_get_field_float(0, "Experience");
        PlayerData[playerid][pMoney] = cache_get_field_int(0, "Money");

        PlayerData[playerid][pHeadshot] = cache_get_field_float(0, "Headshot");
        PlayerData[playerid][pMMR] = cache_get_field_int(0, "MMR");

        PlayerData[playerid][MaxHealth] = cache_get_field_float(0, "MaxHealth");
        PlayerData[playerid][MaxArmour] = cache_get_field_float(0, "MaxArmour");

        PlayerData[playerid][pTeam] = cache_get_field_int(0, "Team");
        PlayerData[playerid][pSkin] = cache_get_field_int(0, "Skin");
        PlayerData[playerid][pKill] = cache_get_field_int(0, "Kill");
        PlayerData[playerid][pDeath] = cache_get_field_int(0, "Death");
        PlayerData[playerid][pClan] = cache_get_field_int(0, "Clan");
        PlayerData[playerid][pClanRank] = cache_get_field_int(0, "ClanRank");

        GetPlayerName(playerid, PlayerData[playerid][pUsername], MAX_PLAYER_NAME + 1);

        Dialog_Show(playerid, LOGIN_DIALOG, DIALOG_STYLE_PASSWORD, ""RED"[!] "WHITE"SERVER LOGIN", ""WHITE"Selamat datang kembali "RED"%s.\n"WHITE"Versi Server: "GREEN"%s\n\n"WHITE"Anda di beri waktu "YELLOW"5 menit "WHITE"untuk login, atau akan di keluarkan dari server.\nSilahkan login dengan memasukkan password ke kolom di bawah ini", "Masuk", "Keluar", ReturnName(playerid), SERVER_VERSION);
    }
    else 
    {
        Dialog_Show(playerid, REGISTER_DIALOG, DIALOG_STYLE_PASSWORD, ""RED"[!] "WHITE"SERVER REGISTER", ""WHITE"Selamat datang"YELLOW" %s.\n"WHITE"Versi Server: "GREEN"%s\n\n"WHITE"Akun anda belum "RED"terdaftar "WHITE"anda akan di beri waktu 5 menit untuk mendaftar.\nSilahkan daftar dengan memasukkan password ke kolom di bawah ini", "Daftar", "Keluar", ReturnName(playerid), SERVER_VERSION);
    }
    return 1;
}


SQL_CheckAccount(playerid)
{
    new query[256];
    format(query, sizeof(query), "SELECT * FROM `player_accounts` WHERE `Username` = '%s' LIMIT 1;", ReturnName(playerid));
    mysql_tquery(g_iHandle, query, "OnAccountChecked", "dd", playerid, g_MysqlRaceCheck[playerid]);
    return 1;
}

IsPlayerMMR(playerid)
{
    return Player_MMR[playerid];
}

IsPlayerKicked(playerid)
{
    return Player_Kicked[playerid];
}

IsPlayerLogged(playerid)
{
    return Player_Logged[playerid];
}

SQL_SaveAccount(playerid)
{
    if(!IsPlayerLogged(playerid))
        return 0;

    new
        query[3048];

    format(query, sizeof(query), "UPDATE `player_accounts` SET `Admin` = '%d', `Score` = '%d', `Experience` = '%.2f', `Money` = '%d', `Team` = '%d', `Skin` = '%d', `MaxHealth` = '%.2f', `MaxArmour` = '%.2f'",
        PlayerData[playerid][pAdmin],
        PlayerData[playerid][pScore],
        PlayerData[playerid][pExp],
        PlayerData[playerid][pMoney],
        PlayerData[playerid][pTeam],
        PlayerData[playerid][pSkin],
        PlayerData[playerid][MaxHealth],
        PlayerData[playerid][MaxArmour]
    );
    format(query, sizeof(query), "%s, `Kill` = '%d', `Death` = '%d', `Clan` = '%d', `ClanRank` = '%d', `Headshot` = '%.2f', `MMR` = '%d' WHERE `ID` = '%d'",
        query,
        PlayerData[playerid][pKill],
        PlayerData[playerid][pDeath],
        PlayerData[playerid][pClan],
        PlayerData[playerid][pClanRank],
        PlayerData[playerid][pHeadshot],
        PlayerData[playerid][pMMR],
        PlayerData[playerid][pID]
    );
    mysql_tquery(g_iHandle, query);
    return 1;
}

timer SpawnTimer[500](playerid)
{
    TogglePlayerSpectating(playerid, 0);
    SetPlayerScore(playerid, PlayerData[playerid][pScore]);
    SQL_SaveAccount(playerid);

    CallLocalFunction("OnPlayerLogin", "d", playerid);
    return 1;
}

timer Player_ScreenTimer[300000](playerid)
{
    if(IsPlayerConnected(playerid))
    {
        SendServerMessage(playerid, "Anda di keluarkan dari server dikarenakan terlalu lama login / register ke dalam server.");
        Dialog_Close(playerid);
        KickEx(playerid);
    }
    return 1;
}

Float:GetPlayerMaxHealth(playerid)
{
    return PlayerData[playerid][MaxHealth];
}

Float:GetPlayerMaxArmour(playerid)
{
    return PlayerData[playerid][MaxArmour];
}

SetPlayerMaxHealth(playerid, Float:amount)
{
    PlayerData[playerid][MaxHealth] += amount;
    return 1;
}

SetPlayerMaxArmour(playerid, Float:amount)
{
    PlayerData[playerid][MaxArmour] += amount;
    return 1;
}

ptask Player_MinuteUpdate[60000](playerid)
{
    static save_counter;
    if(save_counter++ >= 5)
    {
        SQL_SaveAccount(playerid);
        SendServerMessage(playerid, "Data akun mu sudah di perbaharui!");
        save_counter = 0;
    } 
    return 1;
}

