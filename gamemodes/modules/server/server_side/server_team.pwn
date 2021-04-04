GetPlayerTeamEx(playerid)
{
    return PlayerData[playerid][pTeam];
}

SetPlayerTeamEx(playerid, team)
{
    if(!IsPlayerConnected(playerid))
        return 0;

    PlayerData[playerid][pTeam] = team;
    SetPlayerTeam(playerid, team);
    return 1;
}