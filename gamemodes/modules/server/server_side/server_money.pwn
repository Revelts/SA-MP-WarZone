GetPlayerMoneyEx(playerid)
{
    return PlayerData[playerid][pMoney];
}

GivePlayerMoneyEx(playerid, amount)
{
    if (playerid != INVALID_PLAYER_ID)
    {
        PlayerData[playerid][pMoney] += amount;
        GivePlayerMoney(playerid, amount);
    }
    return 1;
}

ptask Player_UpdateMoney[1000](playerid)
{
    if(!IsPlayerLogged(playerid))
        return 0;
        
    new money = GetPlayerMoneyEx(playerid);
    if(GetPlayerMoney(playerid) != money) 
    {
        ResetPlayerMoney(playerid);
        GivePlayerMoney(playerid, money);
    }
    return 1;
}