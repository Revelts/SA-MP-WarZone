Dialog:LOGIN_DIALOG(playerid, response, listitem, inputtext[])
{
    if(!response)
        return KickEx(playerid);

    if(isnull(inputtext))
        return Dialog_Show(playerid, LOGIN_DIALOG, DIALOG_STYLE_PASSWORD, ""RED"[!] "WHITE"SERVER LOGIN", ""WHITE"Selamat datang kembali "RED"%s.\n"WHITE"Versi Server: "GREEN"%s\n\n"WHITE"Anda di beri waktu "YELLOW"5 menit "WHITE"untuk login, atau akan di keluarkan dari server.\nSilahkan login dengan memasukkan password ke kolom di bawah ini", "Masuk", "Keluar", ReturnName(playerid), SERVER_VERSION);

    new hash[65];
    SHA256_PassHash(inputtext, PlayerData[playerid][pSalt], hash, sizeof(hash));

    if(strcmp(hash, PlayerData[playerid][pPassword]))
    {
        if(++Player_LoginAttempts[playerid] >= 3) 
        {
            Player_LoginAttempts[playerid] = 0;
            SendServerMessage(playerid, "Anda telah di kick karena kesalahan 3 kali memasukkan password.");
            KickEx(playerid);
        }
        else {
            Dialog_Show(playerid, LOGIN_DIALOG, DIALOG_STYLE_PASSWORD, ""RED"[!] "WHITE"SERVER LOGIN", ""WHITE"Selamat datang kembali "RED"%s.\n"WHITE"Versi Server: "GREEN"%s\n\n"WHITE"Anda di beri waktu "YELLOW"5 menit "WHITE"untuk login, atau akan di keluarkan dari server.\nSilahkan login dengan memasukkan password ke kolom di bawah ini", "Masuk", "Keluar", ReturnName(playerid), SERVER_VERSION);
            SendErrorMessage(playerid, "Password yang kamu masukan salah!.");
        }
        return 1;
    }
    SetPVarInt(playerid, "AccountBanned", 1);
    if(!ScriptBan_Check(playerid, "Username", PlayerData[playerid][pUsername])) 
    {
        DeletePVar(playerid, "AccountBanned");

        new rand = random(sizeof(RandomSpawn_LosSantos));
        SetSpawnInfo(playerid, PlayerData[playerid][pTeam], PlayerData[playerid][pSkin], RandomSpawn_LosSantos[rand][0], RandomSpawn_LosSantos[rand][1], RandomSpawn_LosSantos[rand][2], RandomSpawn_LosSantos[rand][3], 0, 0 ,0 ,0 ,0 ,0);
        defer SpawnTimer(playerid);

        Player_Logged[playerid] = 1;
        stop Player_LoginTimer[playerid];
    }
    return 1;
}

Dialog:REGISTER_DIALOG(playerid, response, listitem, inputtext[])
{
    if(!response) {
        SendServerMessage(playerid, "Gagal melakukan registrasi, anda keluar dari server.");
        KickEx(playerid);
    }
    else 
    {
        if(strlen(inputtext) < 8 || strlen(inputtext) > 32)
            return Dialog_Show(playerid, REGISTER_DIALOG, DIALOG_STYLE_PASSWORD, ""RED"[!] "WHITE"SERVER REGISTER", ""WHITE"Selamat datang"YELLOW"%s.\n"WHITE"Versi Server: "GREEN"%s\n\n"WHITE"Akun anda belum "RED"terdaftar "WHITE"anda akan di beri waktu 5 menit untuk mendaftar.\nSilahkan daftar dengan memasukkan password ke kolom di bawah ini", "Daftar", "Keluar", ReturnName(playerid), SERVER_VERSION);

        for (new i; i < 64; i++)
            PlayerData[playerid][pSalt][i] = random(79) + 47;

        SHA256_PassHash(inputtext, PlayerData[playerid][pSalt], PlayerData[playerid][pPassword], 64);

        PlayerData[playerid][pRegisterDate] = gettime();

        GetPlayerIp(playerid, PlayerData[playerid][pIP], 16);
        GetPlayerName(playerid, PlayerData[playerid][pUsername], MAX_PLAYER_NAME + 1);

        new query[500];
        format(query, sizeof(query), "INSERT INTO `player_accounts` (`Username`, `Salt`, `Password`, `IP`, `RegisterDate`) VALUES ('%s', '%s', '%s', '%s', '%i')", SQL_ReturnEscaped(PlayerData[playerid][pUsername]), SQL_ReturnEscaped(PlayerData[playerid][pSalt]), SQL_ReturnEscaped(PlayerData[playerid][pPassword]), PlayerData[playerid][pIP], PlayerData[playerid][pRegisterDate]);
        mysql_tquery(g_iHandle, query);

        PlayerData[playerid][pID] = cache_insert_id();

        new rand = random(sizeof(RandomSpawn_LosSantos));
        PlayerData[playerid][pSkin] = 1;
        SetPlayerTeamEx(playerid, 255);
        SetSpawnInfo(playerid, NO_TEAM, 1, RandomSpawn_LosSantos[rand][0], RandomSpawn_LosSantos[rand][1], RandomSpawn_LosSantos[rand][2], RandomSpawn_LosSantos[rand][3], 0, 0, 0, 0, 0, 0);
        SQL_SaveAccount(playerid);

        defer SpawnTimer(playerid);

        Player_Logged[playerid] = 1;
        stop Player_LoginTimer[playerid];
    }
    return 1;
}

