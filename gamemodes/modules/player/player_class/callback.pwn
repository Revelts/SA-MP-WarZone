#include <YSI\y_hooks>

hook OnPlayerLogin(playerid)
{
    SQL_LoadClass(playerid);
}

hook OnPlayerConnect(playerid)
{
    PlayerClass[playerid][pClass] = 0;
    PlayerClass[playerid][pClassLevel] = 1;
    PlayerClass[playerid][pClassExp] = 0.0;
}

hook OnPlayerDisconnect(playerid)
{
    UpdatePlayerClass(playerid);
}

public OnPlayerShootHead(playerid, targetid, Float:amount, weaponid)
{
    if(GetPlayerClass(playerid) == CLASS_SCOUT && weaponid == WEAPON_SNIPER)
    {
        new 
            Float:maxdamage = GetPlayerMaxHealth(targetid),
            Float:health = GetPlayerHealthEx(targetid),
            Float:armour = GetPlayerArmourEx(targetid)
        ;
        InflictDamage(targetid, playerid, maxdamage, health, armour);
    }
    return 1;
}

public OnPlayerShootTorso(playerid, targetid, Float:amount, weaponid)
{
    if(GetPlayerClass(playerid) == CLASS_SPECIALIST)
    {
        new rand = Random(50);
        if(rand > 1) ApplyAnimation(targetid, "PED", "HIT_WALL", 4.1, 0, 0, 0, 0, 0, 1);
    }
}