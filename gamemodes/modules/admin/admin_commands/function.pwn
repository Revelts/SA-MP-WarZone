ShowAdminHelp(playerid)
{
    new string[1024];
    format(string, sizeof(string), ""RED"COMMAND:"WHITE" /kick /ban /banip /unban /unbanip /lookup /givemoney /givemoneyall");
    Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "SERVER ADMIN HELP", string, "Choose", "Close");   
    return 1;
}

SetPlayerAdmin(playerid, level)
{
    PlayerData[playerid][pAdmin] = level;
    return 1;
}

GetPlayerAdminLevel(playerid)
{
    return PlayerData[playerid][pAdmin];
}

GetAdminRankName(level)
{
    new name[128];
    switch(level)
    {
        case ADMIN_LEVEL_ONE: name = "Game Master";
        case ADMIN_LEVEL_TWO: name = "Moderator";
        case ADMIN_LEVEL_THREE: name = "Admin";
        case ADMIN_LEVEL_FOUR: name = "Senior Admin";
        case ADMIN_LEVEL_FIVE: name = "Developer";
    }
    return name;
}


ScriptBan_Add(const ip[], const username[], const issuer[], const reason[])
{
    new query[500];

    format(query, sizeof(query), "INSERT INTO `banned_list` (`IP`, `Username`, `Issuer`, `Reason`, `Date`) VALUES('%s', '%s', '%s', '%s', '%i');",
        SQL_ReturnEscaped(ip), 
        SQL_ReturnEscaped(username), 
        SQL_ReturnEscaped(issuer), 
        SQL_ReturnEscaped(reason), 
        gettime()
    );
    mysql_tquery(g_iHandle, query);
    return 1;
}

ScriptBan_UnbanAccount(const username[])
{
    mysql_tquery(g_iHandle, sprintf("DELETE FROM `banned_list` WHERE `Username` = '%s';", SQL_ReturnEscaped(username)));
    return 1;
}

ScriptBan_UnbanIP(const ip[])
{
    mysql_tquery(g_iHandle, sprintf("DELETE FROM `banned_list` WHERE `IP` = '%s';", SQL_ReturnEscaped(ip)));
    return 1;
}

ScriptBan_AccountIsExists(const type[], const target[])
{
    new Cache:execute;

    execute = mysql_query(g_iHandle, sprintf("SELECT `%s` FROM `player_accounts` WHERE `%s` = '%s' LIMIT 1;", type, type, target));

    if(cache_num_rows()) {
        cache_delete(execute);
        return 1;
    }
    cache_delete(execute);
    return 0;
}

ScriptBan_IsExists(const type[], const target[])
{
    new Cache:execute;

    execute = mysql_query(g_iHandle, sprintf("SELECT `%s` FROM `banned_list` WHERE `%s` = '%s' LIMIT 1;", type, type, target));

    if(cache_num_rows()) {
        cache_delete(execute);
        return 1;
    }
    cache_delete(execute);
    return 0;
}

ScriptBan_Check(playerid, const type[], target[])
{
    new Cache:execute;

    execute = mysql_query(g_iHandle, sprintf("SELECT * FROM `banned_list` WHERE `%s` = '%s' LIMIT 1;", type, target));

    new date;
    new reason[128], ip[16], username[MAX_PLAYER_NAME], banby[MAX_PLAYER_NAME];

    if(cache_num_rows()) 
    {
        date = cache_get_field_int(0, "Date");

        cache_get_field_content(0, "IP", ip);
        cache_get_field_content(0, "Reason", reason);
        cache_get_field_content(0, "Issuer", banby);
        cache_get_field_content(0, "Username", username);

        if(GetPVarInt(playerid, "AccountBanned"))
        {
            Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "Ban Information - Account Banned", ""WHITE"Account mu di ban dari server ini!.\n\nUsername: "RED"%s\n"WHITE"Date: "RED"%s\n"WHITE"Banned by admin: "RED"%s\n"WHITE"Reason: "RED"%s\n\n"WHITE"Untuk request unban silahkan tekan F8 dan ban appeal di forum!.", "Close", "", ReturnName(playerid), ConvertTimestamp(Timestamp:date), banby, reason);
            DeletePVar(playerid, "AccountBanned");
        }
        else if(GetPVarInt(playerid, "IPBanned"))
        {
            Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "Ban Information - IP Banned", ""WHITE"IP mu telah di ban dari server ini!.\n\nIP: "RED"%s\n"WHITE"Date: "RED"%s\n"WHITE"Banned by admin: "RED"%s\n"WHITE"Reason: "RED"%s\n\n"WHITE"Untuk request unban silahkan tekan F8 dan ban appeal di forum!.", "Close", "", ReturnIP(playerid), ConvertTimestamp(Timestamp:date), banby, reason);
            DeletePVar(playerid, "IPBanned");
        }
        KickEx(playerid);
        return 1;
    }

    cache_delete(execute);
	return 0;
}