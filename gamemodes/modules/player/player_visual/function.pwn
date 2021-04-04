//Statistics
new 
    PlayerText:KillValue[MAX_PLAYERS],
    PlayerText:DeathValue[MAX_PLAYERS],
    PlayerText:HeadshotValue[MAX_PLAYERS],
    PlayerText:MMRValue[MAX_PLAYERS],
    PlayerText:BOX[MAX_PLAYERS],
    PlayerText:KillText[MAX_PLAYERS],
    PlayerText:DeathText[MAX_PLAYERS],
    PlayerText:HeadshotText[MAX_PLAYERS],
    PlayerText:MMRText[MAX_PLAYERS],
    PlayerText:Separator_1[MAX_PLAYERS],
    PlayerText:Separator_2[MAX_PLAYERS],
    PlayerText:Separator_3[MAX_PLAYERS],
    PlayerText:Separator_4[MAX_PLAYERS],
    PlayerText:EXPText[MAX_PLAYERS],
    PlayerText:ServerWatermark[MAX_PLAYERS],
    PlayerBar:EXPBar[MAX_PLAYERS]
;


new 
    PlayerText:PlayerFooter[MAX_PLAYERS],
    bool:ShowPlayerFooterText[MAX_PLAYERS],
    Timer:ShowPlayerFooterTimer[MAX_PLAYERS]
;

DrawPlayerStats(playerid)
{
 	ServerWatermark[playerid] = CreatePlayerTextDraw(playerid, 547.000000, 3.000000, "~b~~h~~h~Unity_~w~WarZone");
	PlayerTextDrawFont(playerid, ServerWatermark[playerid], 1);
	PlayerTextDrawLetterSize(playerid, ServerWatermark[playerid], 0.366665, 1.700000);
	PlayerTextDrawTextSize(playerid, ServerWatermark[playerid], 400.000000, 191.500000);
	PlayerTextDrawSetOutline(playerid, ServerWatermark[playerid], 1);
	PlayerTextDrawSetShadow(playerid, ServerWatermark[playerid], 0);
	PlayerTextDrawAlignment(playerid, ServerWatermark[playerid], 2);
	PlayerTextDrawColor(playerid, ServerWatermark[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, ServerWatermark[playerid], 255);
	PlayerTextDrawBoxColor(playerid, ServerWatermark[playerid], 50);
	PlayerTextDrawUseBox(playerid, ServerWatermark[playerid], 0);
	PlayerTextDrawSetProportional(playerid, ServerWatermark[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, ServerWatermark[playerid], 0);
    
	BOX[playerid] = CreatePlayerTextDraw(playerid, 583.000000, 375.000000, "_");
	PlayerTextDrawFont(playerid, BOX[playerid], 1);
	PlayerTextDrawLetterSize(playerid, BOX[playerid], 0.600000, 7.800008);
	PlayerTextDrawTextSize(playerid, BOX[playerid], 298.500000, 110.000000);
	PlayerTextDrawSetOutline(playerid, BOX[playerid], 1);
	PlayerTextDrawSetShadow(playerid, BOX[playerid], 0);
	PlayerTextDrawAlignment(playerid, BOX[playerid], 2);
	PlayerTextDrawColor(playerid, BOX[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, BOX[playerid], 255);
	PlayerTextDrawBoxColor(playerid, BOX[playerid], 135);
	PlayerTextDrawUseBox(playerid, BOX[playerid], 1);
	PlayerTextDrawSetProportional(playerid, BOX[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, BOX[playerid], 0);

	KillText[playerid] = CreatePlayerTextDraw(playerid, 530.000000, 391.000000, "~g~KILL");
	PlayerTextDrawFont(playerid, KillText[playerid], 2);
	PlayerTextDrawLetterSize(playerid, KillText[playerid], 0.200000, 1.049999);
	PlayerTextDrawTextSize(playerid, KillText[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, KillText[playerid], 1);
	PlayerTextDrawSetShadow(playerid, KillText[playerid], 0);
	PlayerTextDrawAlignment(playerid, KillText[playerid], 1);
	PlayerTextDrawColor(playerid, KillText[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, KillText[playerid], 255);
	PlayerTextDrawBoxColor(playerid, KillText[playerid], 50);
	PlayerTextDrawUseBox(playerid, KillText[playerid], 0);
	PlayerTextDrawSetProportional(playerid, KillText[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, KillText[playerid], 0);

	DeathText[playerid] = CreatePlayerTextDraw(playerid, 530.000000, 404.000000, "~r~Death");
	PlayerTextDrawFont(playerid, DeathText[playerid], 2);
	PlayerTextDrawLetterSize(playerid, DeathText[playerid], 0.200000, 1.049999);
	PlayerTextDrawTextSize(playerid, DeathText[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, DeathText[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DeathText[playerid], 0);
	PlayerTextDrawAlignment(playerid, DeathText[playerid], 1);
	PlayerTextDrawColor(playerid, DeathText[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, DeathText[playerid], 255);
	PlayerTextDrawBoxColor(playerid, DeathText[playerid], 50);
	PlayerTextDrawUseBox(playerid, DeathText[playerid], 0);
	PlayerTextDrawSetProportional(playerid, DeathText[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, DeathText[playerid], 0);

	HeadshotText[playerid] = CreatePlayerTextDraw(playerid, 530.000000, 418.000000, "~r~HEADSHOT");
	PlayerTextDrawFont(playerid, HeadshotText[playerid], 2);
	PlayerTextDrawLetterSize(playerid, HeadshotText[playerid], 0.200000, 1.049999);
	PlayerTextDrawTextSize(playerid, HeadshotText[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, HeadshotText[playerid], 1);
	PlayerTextDrawSetShadow(playerid, HeadshotText[playerid], 0);
	PlayerTextDrawAlignment(playerid, HeadshotText[playerid], 1);
	PlayerTextDrawColor(playerid, HeadshotText[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, HeadshotText[playerid], 255);
	PlayerTextDrawBoxColor(playerid, HeadshotText[playerid], 50);
	PlayerTextDrawUseBox(playerid, HeadshotText[playerid], 0);
	PlayerTextDrawSetProportional(playerid, HeadshotText[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, HeadshotText[playerid], 0);

	MMRText[playerid] = CreatePlayerTextDraw(playerid, 530.000000, 432.000000, "~g~MMR");
	PlayerTextDrawFont(playerid, MMRText[playerid], 2);
	PlayerTextDrawLetterSize(playerid, MMRText[playerid], 0.200000, 1.049999);
	PlayerTextDrawTextSize(playerid, MMRText[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, MMRText[playerid], 1);
	PlayerTextDrawSetShadow(playerid, MMRText[playerid], 0);
	PlayerTextDrawAlignment(playerid, MMRText[playerid], 1);
	PlayerTextDrawColor(playerid, MMRText[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, MMRText[playerid], 255);
	PlayerTextDrawBoxColor(playerid, MMRText[playerid], 50);
	PlayerTextDrawUseBox(playerid, MMRText[playerid], 0);
	PlayerTextDrawSetProportional(playerid, MMRText[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, MMRText[playerid], 0);

	Separator_1[playerid] = CreatePlayerTextDraw(playerid, 580.000000, 389.000000, ":");
	PlayerTextDrawFont(playerid, Separator_1[playerid], 0);
	PlayerTextDrawLetterSize(playerid, Separator_1[playerid], 0.270832, 1.399999);
	PlayerTextDrawTextSize(playerid, Separator_1[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Separator_1[playerid], 1);
	PlayerTextDrawSetShadow(playerid, Separator_1[playerid], 0);
	PlayerTextDrawAlignment(playerid, Separator_1[playerid], 1);
	PlayerTextDrawColor(playerid, Separator_1[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, Separator_1[playerid], 255);
	PlayerTextDrawBoxColor(playerid, Separator_1[playerid], 50);
	PlayerTextDrawUseBox(playerid, Separator_1[playerid], 0);
	PlayerTextDrawSetProportional(playerid, Separator_1[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, Separator_1[playerid], 0);

	Separator_2[playerid] = CreatePlayerTextDraw(playerid, 580.000000, 401.000000, ":");
	PlayerTextDrawFont(playerid, Separator_2[playerid], 0);
	PlayerTextDrawLetterSize(playerid, Separator_2[playerid], 0.270832, 1.399999);
	PlayerTextDrawTextSize(playerid, Separator_2[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Separator_2[playerid], 1);
	PlayerTextDrawSetShadow(playerid, Separator_2[playerid], 0);
	PlayerTextDrawAlignment(playerid, Separator_2[playerid], 1);
	PlayerTextDrawColor(playerid, Separator_2[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, Separator_2[playerid], 255);
	PlayerTextDrawBoxColor(playerid, Separator_2[playerid], 50);
	PlayerTextDrawUseBox(playerid, Separator_2[playerid], 0);
	PlayerTextDrawSetProportional(playerid, Separator_2[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, Separator_2[playerid], 0);

	Separator_3[playerid] = CreatePlayerTextDraw(playerid, 580.000000, 416.000000, ":");
	PlayerTextDrawFont(playerid, Separator_3[playerid], 0);
	PlayerTextDrawLetterSize(playerid, Separator_3[playerid], 0.270832, 1.399999);
	PlayerTextDrawTextSize(playerid, Separator_3[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Separator_3[playerid], 1);
	PlayerTextDrawSetShadow(playerid, Separator_3[playerid], 0);
	PlayerTextDrawAlignment(playerid, Separator_3[playerid], 1);
	PlayerTextDrawColor(playerid, Separator_3[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, Separator_3[playerid], 255);
	PlayerTextDrawBoxColor(playerid, Separator_3[playerid], 50);
	PlayerTextDrawUseBox(playerid, Separator_3[playerid], 0);
	PlayerTextDrawSetProportional(playerid, Separator_3[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, Separator_3[playerid], 0);

	Separator_4[playerid] = CreatePlayerTextDraw(playerid, 580.000000, 429.000000, ":");
	PlayerTextDrawFont(playerid, Separator_4[playerid], 0);
	PlayerTextDrawLetterSize(playerid, Separator_4[playerid], 0.270832, 1.399999);
	PlayerTextDrawTextSize(playerid, Separator_4[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Separator_4[playerid], 1);
	PlayerTextDrawSetShadow(playerid, Separator_4[playerid], 0);
	PlayerTextDrawAlignment(playerid, Separator_4[playerid], 1);
	PlayerTextDrawColor(playerid, Separator_4[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, Separator_4[playerid], 255);
	PlayerTextDrawBoxColor(playerid, Separator_4[playerid], 50);
	PlayerTextDrawUseBox(playerid, Separator_4[playerid], 0);
	PlayerTextDrawSetProportional(playerid, Separator_4[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, Separator_4[playerid], 0);

	EXPText[playerid] = CreatePlayerTextDraw(playerid, 530.000000, 378.000000, "~y~EXP");
	PlayerTextDrawFont(playerid, EXPText[playerid], 2);
	PlayerTextDrawLetterSize(playerid, EXPText[playerid], 0.200000, 1.049999);
	PlayerTextDrawTextSize(playerid, EXPText[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, EXPText[playerid], 1);
	PlayerTextDrawSetShadow(playerid, EXPText[playerid], 0);
	PlayerTextDrawAlignment(playerid, EXPText[playerid], 1);
	PlayerTextDrawColor(playerid, EXPText[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, EXPText[playerid], 255);
	PlayerTextDrawBoxColor(playerid, EXPText[playerid], 50);
	PlayerTextDrawUseBox(playerid, EXPText[playerid], 0);
	PlayerTextDrawSetProportional(playerid, EXPText[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, EXPText[playerid], 0);

	KillValue[playerid] = CreatePlayerTextDraw(playerid, 586.000000, 390.000000, "0");
	PlayerTextDrawFont(playerid, KillValue[playerid], 2);
	PlayerTextDrawLetterSize(playerid, KillValue[playerid], 0.208333, 1.299999);
	PlayerTextDrawTextSize(playerid, KillValue[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, KillValue[playerid], 1);
	PlayerTextDrawSetShadow(playerid, KillValue[playerid], 0);
	PlayerTextDrawAlignment(playerid, KillValue[playerid], 1);
	PlayerTextDrawColor(playerid, KillValue[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, KillValue[playerid], 255);
	PlayerTextDrawBoxColor(playerid, KillValue[playerid], 50);
	PlayerTextDrawUseBox(playerid, KillValue[playerid], 0);
	PlayerTextDrawSetProportional(playerid, KillValue[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, KillValue[playerid], 0);

	DeathValue[playerid] = CreatePlayerTextDraw(playerid, 586.000000, 402.000000, "0");
	PlayerTextDrawFont(playerid, DeathValue[playerid], 2);
	PlayerTextDrawLetterSize(playerid, DeathValue[playerid], 0.208333, 1.299999);
	PlayerTextDrawTextSize(playerid, DeathValue[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, DeathValue[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DeathValue[playerid], 0);
	PlayerTextDrawAlignment(playerid, DeathValue[playerid], 1);
	PlayerTextDrawColor(playerid, DeathValue[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, DeathValue[playerid], 255);
	PlayerTextDrawBoxColor(playerid, DeathValue[playerid], 50);
	PlayerTextDrawUseBox(playerid, DeathValue[playerid], 0);
	PlayerTextDrawSetProportional(playerid, DeathValue[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, DeathValue[playerid], 0);

	HeadshotValue[playerid] = CreatePlayerTextDraw(playerid, 586.000000, 416.000000, "0%%");
	PlayerTextDrawFont(playerid, HeadshotValue[playerid], 2);
	PlayerTextDrawLetterSize(playerid, HeadshotValue[playerid], 0.208333, 1.299999);
	PlayerTextDrawTextSize(playerid, HeadshotValue[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, HeadshotValue[playerid], 1);
	PlayerTextDrawSetShadow(playerid, HeadshotValue[playerid], 0);
	PlayerTextDrawAlignment(playerid, HeadshotValue[playerid], 1);
	PlayerTextDrawColor(playerid, HeadshotValue[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, HeadshotValue[playerid], 255);
	PlayerTextDrawBoxColor(playerid, HeadshotValue[playerid], 50);
	PlayerTextDrawUseBox(playerid, HeadshotValue[playerid], 0);
	PlayerTextDrawSetProportional(playerid, HeadshotValue[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, HeadshotValue[playerid], 0);

	MMRValue[playerid] = CreatePlayerTextDraw(playerid, 586.000000, 430.000000, "0");
	PlayerTextDrawFont(playerid, MMRValue[playerid], 2);
	PlayerTextDrawLetterSize(playerid, MMRValue[playerid], 0.208333, 1.299999);
	PlayerTextDrawTextSize(playerid, MMRValue[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, MMRValue[playerid], 1);
	PlayerTextDrawSetShadow(playerid, MMRValue[playerid], 0);
	PlayerTextDrawAlignment(playerid, MMRValue[playerid], 1);
	PlayerTextDrawColor(playerid, MMRValue[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, MMRValue[playerid], 255);
	PlayerTextDrawBoxColor(playerid, MMRValue[playerid], 50);
	PlayerTextDrawUseBox(playerid, MMRValue[playerid], 0);
	PlayerTextDrawSetProportional(playerid, MMRValue[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, MMRValue[playerid], 0);

	EXPBar[playerid] = CreatePlayerProgressBar(playerid, 552.000000, 381.000000, 87.000000, 4.000000, -1, 100.000000, 0);
	SetPlayerProgressBarValue(playerid, EXPBar[playerid], 100.000000);
    return 1;
}

DrawPlayerFooter(playerid)
{
    PlayerFooter[playerid] = CreatePlayerTextDraw(playerid, 321.000000, 352.000793, "_");
    PlayerTextDrawLetterSize(playerid, PlayerFooter[playerid], 0.214499, 1.031875);
    PlayerTextDrawAlignment(playerid, PlayerFooter[playerid], 2);
    PlayerTextDrawColor(playerid, PlayerFooter[playerid], -1);
    PlayerTextDrawSetShadow(playerid, PlayerFooter[playerid], 0);
    PlayerTextDrawSetOutline(playerid, PlayerFooter[playerid], 1);
    PlayerTextDrawBackgroundColor(playerid, PlayerFooter[playerid], 255);
    PlayerTextDrawFont(playerid, PlayerFooter[playerid], 1);
    PlayerTextDrawSetProportional(playerid, PlayerFooter[playerid], 1);
    PlayerTextDrawSetShadow(playerid, PlayerFooter[playerid], 0);
    return 1;
}

ShowPlayerFooter(playerid, string[], time = 3000) {
    if(ShowPlayerFooterText[playerid]) {
        PlayerTextDrawHide(playerid, PlayerFooter[playerid]);
        stop ShowPlayerFooterTimer[playerid];
    }
    PlayerTextDrawSetString(playerid, PlayerFooter[playerid], string);
    PlayerTextDrawShow(playerid, PlayerFooter[playerid]);
    ShowPlayerFooterText[playerid] = true;
    ShowPlayerFooterTimer[playerid] = defer HidePlayerFooter[time](playerid);
    return 1;
}


timer HidePlayerFooter[3000](playerid) 
{
    if(!ShowPlayerFooterText[playerid])
        return 0;

    ShowPlayerFooterText[playerid] = false;
    stop ShowPlayerFooterTimer[playerid];
    return PlayerTextDrawHide(playerid, PlayerFooter[playerid]);
}
ShowPlayerStatistics(playerid)
{
    PlayerTextDrawShow(playerid, KillValue[playerid]);
    PlayerTextDrawShow(playerid, DeathValue[playerid]);
    PlayerTextDrawShow(playerid, HeadshotValue[playerid]);
    PlayerTextDrawShow(playerid, MMRValue[playerid]);
    PlayerTextDrawShow(playerid, BOX[playerid]);
    PlayerTextDrawShow(playerid, KillText[playerid]);
    PlayerTextDrawShow(playerid, DeathText[playerid]);
    PlayerTextDrawShow(playerid, HeadshotText[playerid]);
    PlayerTextDrawShow(playerid, MMRText[playerid]);
    PlayerTextDrawShow(playerid, Separator_1[playerid]);
    PlayerTextDrawShow(playerid, Separator_2[playerid]);
    PlayerTextDrawShow(playerid, Separator_3[playerid]);
    PlayerTextDrawShow(playerid, Separator_4[playerid]);
    PlayerTextDrawShow(playerid, EXPText[playerid]);
    PlayerTextDrawShow(playerid, ServerWatermark[playerid]);
    ShowPlayerProgressBar(playerid, EXPBar[playerid]);
    return 1;
}
UpdatePlayerStatsTD(playerid)
{
    new 
        Float:exp = PlayerData[playerid][pExp],
        kill = PlayerData[playerid][pKill],
        death = PlayerData[playerid][pDeath],
        Float:headshot = GetPlayerHeadshot(playerid),
        mmr = GetPlayerMMR(playerid)
    ;
    PlayerTextDrawSetString(playerid, KillValue[playerid], sprintf("%d", kill));
    PlayerTextDrawSetString(playerid, DeathValue[playerid], sprintf("%d", death));
    PlayerTextDrawSetString(playerid, HeadshotValue[playerid], sprintf("%.2f%%", headshot));
    PlayerTextDrawSetString(playerid, MMRValue[playerid], sprintf("%d", mmr));
    SetPlayerProgressBarValue(playerid, EXPBar[playerid], exp);
    return 1;
}

UpdateKillerStats(playerid, killerid)
{
    GivePlayerMoneyEx(killerid, 500);
    SetPlayerExp(killerid, 10);
    PlayerData[killerid][pKill]++;
    PlayerData[playerid][pDeath]++;
    SQL_SaveAccount(playerid);
    SQL_SaveAccount(killerid);
    return 1;
}

ResetStatistics(playerid)
{
    PlayerData[playerid][pExp] = 0;
    PlayerData[playerid][pScore] = 0;
    PlayerData[playerid][pMoney] = 0;
    PlayerData[playerid][pAdmin] = 0;

    PlayerData[playerid][pSkin] = 1;
    PlayerData[playerid][pTeam] = 255;
    
    PlayerData[playerid][pDeath] = 0;
    PlayerData[playerid][pKill] = 0;
    PlayerData[playerid][pDeath] = 0;

    PlayerData[playerid][pHealth] = 100.0;
    PlayerData[playerid][pArmour] = 0;

	PlayerData[playerid][MaxHealth] = 100.0;
    PlayerData[playerid][MaxArmour] = 100.0;

    PlayerData[playerid][pClan] = -1;
    PlayerData[playerid][pClanRank] = 0;

    PlayerData[playerid][pVehicle] = INVALID_VEHICLE_ID;

    Player_Logged[playerid] = 0;
    Player_LoginAttempts[playerid] = 0;
    Player_Kicked[playerid] = 0;

    stop Player_LoginTimer[playerid];
    return 1;
}


ptask Player_UpdateCharacter[1000](playerid)
{
    if(!IsPlayerLogged(playerid))
        return 0;
        
    UpdatePlayerStatsTD(playerid);
    return 1;
}