/*
This file was generated by Nickk's TextDraw editor script
Nickk888 is the author of the NTD script
*/

#include <a_samp>
#include <mapandreas>
#include <YSI\y_iterate>
#include <YSI\y_timers>

new PlayerText:PlayerTD[MAX_PLAYERS][4];

ShowDebugger(playerid)
{
  PlayerTextDrawShow(playerid, PlayerTD[playerid][0]);
  PlayerTextDrawShow(playerid, PlayerTD[playerid][1]);
  PlayerTextDrawShow(playerid, PlayerTD[playerid][2]);
  PlayerTextDrawShow(playerid, PlayerTD[playerid][3]);
}

HideDebugger(playerid)
{
  PlayerTextDrawHide(playerid, PlayerTD[playerid][0]);
  PlayerTextDrawHide(playerid, PlayerTD[playerid][1]);
  PlayerTextDrawHide(playerid, PlayerTD[playerid][2]);
  PlayerTextDrawHide(playerid, PlayerTD[playerid][3]);
}

DestroyDebugger(playerid)
{
  PlayerTextDrawDestroy(playerid, PlayerTD[playerid][0]);
  PlayerTextDrawDestroy(playerid, PlayerTD[playerid][1]);
  PlayerTextDrawDestroy(playerid, PlayerTD[playerid][2]);
  PlayerTextDrawDestroy(playerid, PlayerTD[playerid][3]);
}

ptask UpdatePlayerPos[1000](playerid)
{
  if (!IsPlayerConnected(playerid))
  {
    HideDebugger(playerid);
    return 0;
  }

  if (!IsPlayerAdmin(playerid))
  {
    HideDebugger(playerid);
    return 0;
  }

  ShowDebugger(playerid);

  new
    Float:x,
    Float:y,
    Float:z_opp,
    Float:z_mapandreas,
    str[32]
  ;

  GetPlayerPos(playerid, x, y, z_opp);
  MapAndreas_FindZ_For2DCoord(x, y, z_mapandreas);

  format(str, sizeof(str), "X: %.2f", x);
  PlayerTextDrawSetString(playerid, PlayerTD[playerid][0], str);
  format(str, sizeof(str), "Y: %.2f", y);
  PlayerTextDrawSetString(playerid, PlayerTD[playerid][1], str);
  format(str, sizeof(str), "Z1: %.2f", z_opp);
  PlayerTextDrawSetString(playerid, PlayerTD[playerid][2], str);
  format(str, sizeof(str), "Z2: %.2f", z_mapandreas);
  PlayerTextDrawSetString(playerid, PlayerTD[playerid][3], str);

  return 1;
}

public OnFilterScriptInit()
{
  MapAndreas_Init(MAP_ANDREAS_MODE_NOBUFFER, "scriptfiles/SAfull.hmap");
  return 1;
}

public OnFilterScriptExit()
{
  foreach(new i : Player)
  {
    DestroyDebugger(i);
  }

  MapAndreas_Unload();
  return 1;
}

public OnPlayerConnect(playerid)
{
  PlayerTD[playerid][0] = CreatePlayerTextDraw(playerid, 197.000000, 225.000000, "X: 1.00");
  PlayerTextDrawFont(playerid, PlayerTD[playerid][0], 2);
  PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][0], 0.341666, 2.099997);
  PlayerTextDrawTextSize(playerid, PlayerTD[playerid][0], 368.500000, 17.000000);
  PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][0], 1);
  PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][0], 0);
  PlayerTextDrawAlignment(playerid, PlayerTD[playerid][0], 1);
  PlayerTextDrawColor(playerid, PlayerTD[playerid][0], -1);
  PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][0], 255);
  PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][0], 50);
  PlayerTextDrawUseBox(playerid, PlayerTD[playerid][0], 0);
  PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][0], 1);
  PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][0], 0);

  PlayerTD[playerid][1] = CreatePlayerTextDraw(playerid, 197.000000, 241.000000, "Y: 1.00");
  PlayerTextDrawFont(playerid, PlayerTD[playerid][1], 2);
  PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][1], 0.341666, 2.099997);
  PlayerTextDrawTextSize(playerid, PlayerTD[playerid][1], 368.500000, 17.000000);
  PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][1], 1);
  PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][1], 0);
  PlayerTextDrawAlignment(playerid, PlayerTD[playerid][1], 1);
  PlayerTextDrawColor(playerid, PlayerTD[playerid][1], -1);
  PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][1], 255);
  PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][1], 50);
  PlayerTextDrawUseBox(playerid, PlayerTD[playerid][1], 0);
  PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][1], 1);
  PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][1], 0);

  PlayerTD[playerid][2] = CreatePlayerTextDraw(playerid, 192.000000, 257.000000, "Z1: 1.00");
  PlayerTextDrawFont(playerid, PlayerTD[playerid][2], 2);
  PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][2], 0.341666, 2.099997);
  PlayerTextDrawTextSize(playerid, PlayerTD[playerid][2], 368.500000, 17.000000);
  PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][2], 1);
  PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][2], 0);
  PlayerTextDrawAlignment(playerid, PlayerTD[playerid][2], 1);
  PlayerTextDrawColor(playerid, PlayerTD[playerid][2], -1);
  PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][2], 255);
  PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][2], 50);
  PlayerTextDrawUseBox(playerid, PlayerTD[playerid][2], 0);
  PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][2], 1);
  PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][2], 0);

  PlayerTD[playerid][3] = CreatePlayerTextDraw(playerid, 188.000000, 273.000000, "Z2: 1.00");
  PlayerTextDrawFont(playerid, PlayerTD[playerid][3], 2);
  PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][3], 0.341666, 2.099997);
  PlayerTextDrawTextSize(playerid, PlayerTD[playerid][3], 368.500000, 17.000000);
  PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][3], 1);
  PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][3], 0);
  PlayerTextDrawAlignment(playerid, PlayerTD[playerid][3], 1);
  PlayerTextDrawColor(playerid, PlayerTD[playerid][3], -1);
  PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][3], 255);
  PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][3], 50);
  PlayerTextDrawUseBox(playerid, PlayerTD[playerid][3], 0);
  PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][3], 1);
  PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][3], 0);

  return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
  DestroyDebugger(playerid);
  return 1;
}