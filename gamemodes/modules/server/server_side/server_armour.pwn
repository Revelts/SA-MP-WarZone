Float:GetPlayerArmourEx(playerid)
{
    return PlayerData[playerid][pArmour];
}

SetPlayerArmourEx(playerid, Float:armour)
{
    if(!IsPlayerConnected(playerid))
        return 0;

    new Float:maxarmour = GetPlayerMaxArmour(playerid);
    PlayerData[playerid][pArmour] = armour;
    if(PlayerData[playerid][pArmour] > maxarmour)
    {
        PlayerData[playerid][pArmour] = maxarmour;
        SetPlayerArmour(playerid, maxarmour);
    }
    else if(PlayerData[playerid][pArmour] <= 0)
    {
        PlayerData[playerid][pArmour] = 0;
        SetPlayerArmour(playerid, 0);
    }
    else
    {
        SetPlayerArmour(playerid, PlayerData[playerid][pArmour]);
    }
    return 1;
}

ptask Player_UpdateArmour[1000](playerid)
{
    if(!IsPlayerLogged(playerid))
        return 0;
        
    new 
        Float:server_armour = GetPlayerArmourEx(playerid),
        Float:client_armour
    ;

    GetPlayerArmour(playerid, client_armour);

    if(client_armour != server_armour)
    {
        SetPlayerArmourEx(playerid, server_armour);
    }
    return 1;
}