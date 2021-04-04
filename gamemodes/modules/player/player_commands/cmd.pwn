CMD:setteam(playerid, params[])
{
    new teamid;
    if(sscanf(params, "d", teamid))
        return SendSyntaxMessage(playerid, "/setteam [teamid] (range 0 - 255)");

    if(teamid < 0 || teamid > 255)
        return SendErrorMessage(playerid, "/setteam [teamid] (batas teamid 0 - 255)");

    SetPlayerTeamEx(playerid, teamid);
    SendServerMessage(playerid, "Kamu mengubah set-team kamu menjadi team %d", teamid);
    return 1;
}

CMD:skin(playerid, params[])
{
    new skinid;
    if(sscanf(params, "d", skinid))
        return SendSyntaxMessage(playerid, "/skin [skinid]");
    
    if(skinid < 1 || skinid > 299)
        return SendErrorMessage(playerid, "/skin [skinid] (batas skin 1 - 299");

    SetPlayerSkinEx(playerid, skinid);
    return 1;
}

CMD:goto(playerid, params[])
{
    if(GetPlayerAdminLevel(playerid) < 1)
        return SendErrorMessage(playerid, "Kamu tidak dapat menggunakan perintah ini!");

    new targetid;
    if(sscanf(params, "u", targetid))
        return SendSyntaxMessage(playerid, "/goto [playerid]");

    if(targetid == INVALID_PLAYER_ID)
        return SendErrorMessage(playerid, "Player tersebut tidak terkoneksi ke-server");
        
    SendPlayerToPlayer(playerid, targetid);
    return 1;
}

CMD:gotoco(playerid, params[])
{
	new Float: pos[3], int;
	if(sscanf(params, "fffd", pos[0], pos[1], pos[2], int)) return SendClientMessageEx(playerid, COLOR_WHITE, "USAGE: /gotoco [x coordinate] [y coordinate] [z coordinate] [interior]");

	SendClientMessageEx(playerid, COLOR_WHITE, "You have been teleported to the coordinates specified.");
	SetPlayerPos(playerid, pos[0], pos[1], pos[2]);
	SetPlayerInterior(playerid, int);
	return 1;
}

CMD:cmc(playerid, params[])
{
    ClearPlayerChat(playerid, 50);
    return 1;
}

CMD:help(playerid, params[])
{
    ShowPlayerHelp(playerid);
    return 1;
}

CMD:pm(playerid, params[])
{
    new userid, text[128];

    if(sscanf(params, "us[128]", userid, text))
        return SendSyntaxMessage(playerid, "/pm [playerid/PartOfName] [message]");

    SendClientMessageEx(userid, X11_YELLOW_2, "[PM] dari %s (%d) : %s", ReturnName(playerid), playerid, text);
    SendClientMessageEx(playerid, X11_YELLOW_2, "[PM] ke %s (%d) : %s", ReturnName(userid), userid, text);
    return 1;
}

CMD:mmr(playerid, params[])
{
    new string[255];
    if(IsPlayerMMR(playerid))
    {
        Player_MMR[playerid] = 0;
        SendServerMessage(playerid, "Kamu tidak lagi berada pada mode MMR!");
        format(string, sizeof(string), "[MMR] "RED"%s "WHITE"telah keluar dari mode "RED"MMR!", ReturnName(playerid));
        SendClientMessageToAll(COLOR_YELLOW, string);
    }
    else
    {
        Player_MMR[playerid] = 1;
        SendServerMessage(playerid, "Kamu memasuki mode MMR!");
        format(string, sizeof(string), "[MMR] "RED"%s "WHITE"telah memasuki mode "RED"MMR!", ReturnName(playerid));
        SendClientMessageToAll(COLOR_YELLOW, string);
    }
    return 1;
}

CMD:upgrade(playerid, params[])
{
    new string[1024];
    strcat(string, ""YELLOW"Upgrade List\t"RED"Amount\t"GREEN"Price\n");
    strcat(string, ""RED"Max Health Point\t"YELLOW"1.0\t"GREEN"$500\n");
    strcat(string, ""RED"Max Armour Point\t"YELLOW"1.0\t"GREEN"$500\n");
    Dialog_Show(playerid, UPGRADE_MENU, DIALOG_STYLE_TABLIST_HEADERS, "Upgrade Point", string, "Upgrade", "Close");
    return 1;
}