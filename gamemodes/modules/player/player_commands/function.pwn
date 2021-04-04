ShowPlayerHelp(playerid)
{
    new string[1024];
    format(string, sizeof(string), "General Commands\nVehicle Help\nClan Help\nHouse Help\nBusiness Help\n");
    Dialog_Show(playerid, DIALOG_HELP, DIALOG_STYLE_LIST, "SERVER HELP", string, "Choose", "Close");   
    return 1;
}

SetPlayerSkinEx(playerid, skinid)
{
    SetPlayerSkin(playerid, skinid);
    PlayerData[playerid][pSkin] = skinid;
    return 1;
}

ClearPlayerChat(playerid, line)
{
    for (new i = 0; i < line; i ++) {
        SendClientMessage(playerid, -1,"");
    }
}

SendPlayerToPlayer(playerid, targetid)
{
    new Float:x, Float:y, Float:z;
    GetPlayerPos(targetid, x, y, z);
    SetPlayerPos(playerid, x, y, z);
    return 1;
}