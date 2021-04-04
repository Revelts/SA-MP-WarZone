Float:GetPlayerHealthEx(playerid)
{
    return PlayerData[playerid][pHealth];
}

SetPlayerHealthEx(playerid, Float:health)
{
    if(!IsPlayerConnected(playerid))
        return 0;

    new Float:maxhealth = GetPlayerMaxHealth(playerid);
    PlayerData[playerid][pHealth] = health;
    if(PlayerData[playerid][pHealth] > maxhealth)
    {
        PlayerData[playerid][pHealth] = maxhealth;
        SetPlayerHealth(playerid, maxhealth);
    }
    else if(PlayerData[playerid][pHealth] <= 0)
    {
        PlayerData[playerid][pHealth] = 0;
        SetPlayerHealth(playerid, 0);
    }
    else
    {
        SetPlayerHealth(playerid, PlayerData[playerid][pHealth]);
    }
    return 1;
} 

ptask Player_UpdateHealth[1000](playerid)
{
    if(!IsPlayerLogged(playerid))
        return 0;

    new 
        Float:server_health = GetPlayerHealthEx(playerid),
        Float:client_health
    ;
    
    GetPlayerHealth(playerid, client_health);

    if(client_health != server_health)
    {
        SetPlayerHealthEx(playerid, server_health);
    }
    return 1;
}