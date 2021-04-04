CMD:ahelp(playerid, params[])
{
    if(GetPlayerAdminLevel(playerid) < 1)
        return SendErrorMessage(playerid, "Kamu tidak dapat menggunakan perintah ini!");

    ShowAdminHelp(playerid);
    return 1;
}

CMD:kick(playerid, params[])
{
    new userid, reason[128];
    if(GetPlayerAdminLevel(playerid) < 1)
        return SendErrorMessage(playerid, "Kamu tidak dapat menggunakan perintah ini!");

    if(sscanf(params, "us[128]", userid, reason))
        return SendSyntaxMessage(playerid, "/kick [playerid] [reason]");

    if(userid == INVALID_PLAYER_ID)
        return SendErrorMessage(playerid, "Player tersebut tidak terhubung ke dalam server");
    
    KickEx(userid, 200);
    SendClientMessageToAllEx(X11_TOMATO_1, "[ADMIN] %s telah di kick dari server oleh %s alasan : %s", ReturnName(userid), ReturnName(playerid), reason);
    return 1;
}

CMD:givemoney(playerid, params[])
{
    new userid, amount;

    if(GetPlayerAdminLevel(playerid) < 5)
        return SendErrorMessage(playerid, "Kamu tidak dapat menggunakan perintah ini!");

    if(sscanf(params, "ud", userid, amount))
        return SendErrorMessage(playerid, "/givemoney [playerid] [amount]");

    if(userid == INVALID_PLAYER_ID)
        return SendErrorMessage(playerid, "Player tersebut tidak terhubung ke dalam server");

    GivePlayerMoneyEx(userid, amount);
    SendServerMessage(playerid, "Kamu memberikan uang ke %s sejumlah $%s !", ReturnName(userid), FormatNumber(amount));
    SendServerMessage(userid, "Kamu diberikan uang oleh %s sejumlah $%s !", ReturnName(playerid), FormatNumber(amount));    
    return 1;
}


CMD:givemoneyall(playerid, params[])
{
    new amount;

    if(GetPlayerAdminLevel(playerid) < 5)
        return SendErrorMessage(playerid, "Kamu tidak dapat menggunakan perintah ini!");

    if(sscanf(params, "d", amount))
        return SendErrorMessage(playerid, "/givemoneyall [amount]");

    foreach(new i : Player)
    {
        GivePlayerMoneyEx(i, amount);
    }   
    SendClientMessageToAllEx(COLOR_WHITE, ""RED"[Notification] "YELLOW"%s "WHITE"memberikan uang sejumlah "YELLOW"$%s "WHITE"untuk semua player!", ReturnName(playerid), FormatNumber(amount));
    return 1;
}

CMD:setadmin(playerid, params[])
{
    new userid, level;
    if(GetPlayerAdminLevel(playerid) < 4)
        return SendErrorMessage(playerid, "Kamu tidak dapat menggunakan perintah ini");

    if(sscanf(params, "ud", userid, level))
        return SendSyntaxMessage(playerid, "/setadmin [playerid] [level]");

    if(userid == INVALID_PLAYER_ID)
        return SendErrorMessage(playerid, "Player tersebut tidak terhubung ke dalam server");

    if(level < 1 || level > 5)
        return SendErrorMessage(playerid, "Level admin hanya di batasi dari level 1 - 5");

    SetPlayerAdmin(userid, level);
    SendAdminMessage(X11_TOMATO_1, "[ADMIN] %s telah di angkat menjadi %s oleh %s", ReturnName(userid), GetAdminRankName(level), ReturnName(playerid));
    return 1;
}

CMD:ban(playerid, params[])
{
    new userid, reason[128], string[1024];
    if(GetPlayerAdminLevel(playerid) < 2)
        return SendErrorMessage(playerid, "Kamu tidak di perbolehkan menggunakan perintah ini!");
    
    if(sscanf(params, "us[128]", userid, reason))
        return SendSyntaxMessage(playerid, "/ban [playerid/username] [reason]");

    if(userid == INVALID_PLAYER_ID || (!IsPlayerConnected(userid) && IsPlayerKicked(playerid)))
        return SendErrorMessage(playerid, "Player tersebut tidak login didalam server.");

    if(GetPlayerAdminLevel(userid) > GetPlayerAdminLevel(playerid))
        return SendErrorMessage(playerid, "Level admin yang ingin kamu ban lebih tinggi darimu.");

    SendClientMessageToAllEx(X11_TOMATO_1, "[ADMIN]: %s telah di banned dari server oleh %s.", ReturnName(userid), PlayerData[playerid][pUsername]);
    SendClientMessageToAllEx(X11_TOMATO_1, "Reason: %s", reason);

    ScriptBan_Add("", PlayerData[userid][pUsername], ReturnName(playerid), reason);

    format(string, sizeof(string), ""RED"Akun mu telah di banned dari server!.\n\n"WHITE"Username: "RED"%s\n"WHITE"Reason: "RED"%s\n"WHITE"Admin Issuer: "RED"%s\n\n"WHITE"Tekan F8 untuk mengambil screenshot dan membuat ban appeal di forum!.",
    ReturnName(userid), 
    reason, 
    ReturnName(playerid)
    );

    Dialog_Show(userid, ShowOnly, DIALOG_STYLE_MSGBOX, "Banned", "", "Close", "");
    KickEx(userid);
    return 1;
}

CMD:banip(playerid, params[])
{
    if(GetPlayerAdminLevel(playerid) < 3)
        return SendErrorMessage(playerid, "Kamu tidak di perbolehkan menggunakan perintah ini!");
    
    new ip[16], reason[128];
        
    if(sscanf(params, "s[16]s[124]", ip, reason))
        return SendSyntaxMessage(playerid, "/banip [ip address] [reason]");

    if(!IsAnIP(ip))
        return SendErrorMessage(playerid, "Format ip salah, ikuti format berikut: xx.xx.xx.xx");

    if(ScriptBan_IsExists("IP", ip))
        return SendErrorMessage(playerid, "IP telah dibanned sebelumnya.");

    ScriptBan_Add(ip, "", PlayerData[playerid][pUsername], reason);

    SendClientMessageToAllEx(X11_TOMATO_1, "[ADMIN]: %s telah memblokir IP Address \"%s\".", ReturnName(playerid), ip);
    SendClientMessageToAllEx(X11_TOMATO_1, "Reason: %s", reason);

    foreach (new i : Player) if(!strcmp(ReturnIP(i), ip)) {
        KickEx(i);
    }
    return 1;
}

CMD:unban(playerid, params[])
{
    new username[MAX_PLAYER_NAME];

    if(GetPlayerAdminLevel(playerid) < 2)
        return SendErrorMessage(playerid, "Kamu tidak di perbolehkan menggunakan perintah ini!");

    if(sscanf(params, "s[24]", username))
        return SendSyntaxMessage(playerid, "/unban [username]");

    if(strlen(username) > 24)
        return SendErrorMessage(playerid, "Nama karakter tidak bisa lebih dari 24 karakter.");

    if(!ScriptBan_IsExists("Username", username))
        return SendErrorMessage(playerid, "Nama karakter tidak terdaftar diserver.");

    ScriptBan_UnbanAccount(username);
    SendAdminMessage(X11_TOMATO_1, "[ADMIN]: %s telah unbanned username \"%s\".", ReturnName(playerid), username);
    return 1;
}

CMD:unbanip(playerid, params[])
{
    if(GetPlayerAdminLevel(playerid) < 2)
        return SendErrorMessage(playerid, "Kamu tidak di perbolehkan menggunakan perintah ini!");

    new ip[16];
        
    if(sscanf(params, "s[16]", ip))
        return SendSyntaxMessage(playerid, "/unbanip [ip address]");

    if(!IsAnIP(ip))
        return SendErrorMessage(playerid, "Format ip salah, ikuti format berikut: xx.xx.xx.xx");

    if(!ScriptBan_IsExists("IP", ip))
        return SendErrorMessage(playerid, "IP tidak ada dalam daftar banned.");

    ScriptBan_UnbanIP(ip);

    SendAdminMessage(X11_TOMATO_1, "[ADMIN]: %s telah unbanned IP \"%s\".", ReturnName(playerid), ip);
    return 1;
}

CMD:oban(playerid, params[])
{
    new username[MAX_PLAYER_NAME], reason[128];
        
    if(GetPlayerAdminLevel(playerid) < 2)
        return SendErrorMessage(playerid, "Kamu tidak di perbolehkan menggunakan perintah ini!");

    if(sscanf(params, "s[24]s[124]", username, reason))
        return SendSyntaxMessage(playerid, "/o(ffline)ban [username] [reason]");
        
    if(!ScriptBan_AccountIsExists("Username", username))
        return SendErrorMessage(playerid, "Nama karakter tidak terdaftar diserver.");

    if(ScriptBan_IsExists("Username", username))
        return SendErrorMessage(playerid, "Nama karakter telah dibanned sebelumnya.");

    ScriptBan_Add("", username, PlayerData[playerid][pUsername], reason);

    SendClientMessageToAllEx(X11_TOMATO_1, "[ADMIN]: %s telah di banned dari server oleh %s", username, ReturnName(playerid));
    SendClientMessageToAllEx(X11_TOMATO_1, "Reason: %s ", reason);
    return 1;
}

CMD:lookup(playerid, params[])
{
    if(GetPlayerAdminLevel(playerid) < 1)
        return SendErrorMessage(playerid, "Kamu tidak di perbolehkan menggunakan perintah ini!");

    new userid;

    if(sscanf(params, "u", userid))
        return SendSyntaxMessage(playerid, "/lookup [playerid]");

    if(!IsPlayerConnected(userid))
        return SendErrorMessage(playerid, "Invalid player id.");

    new
        city[24],
        country[24],
        region[24],
        isp[24];

    GetPlayerCountry(userid, country);
    GetPlayerCity(userid, city);
    GetPlayerRegion(userid, region);
    GetPlayerISP(userid, isp);

    Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "Lookup", ""WHITE"Lookup data dari username "YELLOW"%s\n\n"WHITE"IP: {C0C0C0}%s\n"WHITE"Negara: {C0C0C0}%s\n"WHITE"Kota: {C0C0C0}%s\n"WHITE"Region: {C0C0C0}%s\n"WHITE"ISP: {C0C0C0}%s", "Close", "", ReturnName(userid), ReturnIP(userid), country, city, region, isp);
    return 1;
}