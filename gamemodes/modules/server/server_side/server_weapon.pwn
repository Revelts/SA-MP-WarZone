#define WEAPON_SLOT 13

enum E_SERVER_WEAPON
{
    pWeapons[WEAPON_SLOT],
	pWeaponsAmmo[WEAPON_SLOT]
};

new PlayerWeapon[MAX_PLAYERS][E_SERVER_WEAPON];

hook OnPlayerConnect(playerid)
{
    ResetPlayerWeaponEx(playerid);
}

stock GivePlayerValidWeapon(playerid, weaponid, ammo, slot, bool:giveammo = false)
{
    new 
        weapon_data, 
        ammo_data
    ;

    PlayerWeapon[playerid][pWeapons][slot] = weaponid;
    GivePlayerWeapon(playerid, weaponid, ammo);

    if(giveammo)
    {
        GetPlayerWeaponData(playerid, slot, weapon_data, ammo_data);
        if (weapon_data == weaponid) PlayerWeapon[playerid][pWeaponsAmmo][slot] = ammo_data;
        else PlayerWeapon[playerid][pWeaponsAmmo][slot] = ammo;
    }

    return 1;
}

stock GivePlayerWeaponEx(playerid, weapon, ammo) 
{
	switch(weapon) 
    {
		case 0, 1: GivePlayerValidWeapon(playerid, weapon, ammo, 0);
	    case 2, 3, 4, 5, 6, 7, 8, 9: GivePlayerValidWeapon(playerid, weapon, ammo, 1);
	    case 22, 23, 24: GivePlayerValidWeapon(playerid, weapon, ammo, 2, true);
	    case 25, 26, 27: GivePlayerValidWeapon(playerid, weapon, ammo, 3, true);
	    case 28, 29, 32: GivePlayerValidWeapon(playerid, weapon, ammo, 4, true);
	    case 30, 31: GivePlayerValidWeapon(playerid, weapon, ammo, 5, true);
	    case 33, 34: GivePlayerValidWeapon(playerid, weapon, ammo, 6, true);
	    case 35, 36, 37, 38: GivePlayerValidWeapon(playerid, weapon, ammo, 7, true);
	    case 16, 17, 18, 39: GivePlayerValidWeapon(playerid, weapon, ammo, 8, true);
	    case 41, 42, 43: GivePlayerValidWeapon(playerid, weapon, ammo, 9);
	    case 10, 11, 12, 13, 14, 15: GivePlayerValidWeapon(playerid, weapon, ammo, 10);
	    case 44, 45, 46: GivePlayerValidWeapon(playerid, weapon, ammo, 11);
	    case 40: GivePlayerValidWeapon(playerid, weapon, ammo, 12, true);
	}
	return 1;
}

stock ResetPlayerWeaponEx(playerid) 
{
    ResetPlayerWeapons(playerid);
    for(new i = 0; i < WEAPON_SLOT; i++)
    {
        PlayerWeapon[playerid][pWeapons][i] = 0;
        PlayerWeapon[playerid][pWeaponsAmmo][i] = 0;
    }
	return 1;
}

stock CheckPlayerWeapon(playerid)
{
    if(PlayerWeapon[playerid][pWeapons][0] != 1 && GetPlayerWeapon(playerid) == 1) return 1;
    if(PlayerWeapon[playerid][pWeapons][1] != 2 && GetPlayerWeapon(playerid) == 2) return 1;
    if(PlayerWeapon[playerid][pWeapons][1] != 3 && GetPlayerWeapon(playerid) == 3) return 1;
    if(PlayerWeapon[playerid][pWeapons][1] != 4 && GetPlayerWeapon(playerid) == 4) return 1;
    if(PlayerWeapon[playerid][pWeapons][1] != 5 && GetPlayerWeapon(playerid) == 5) return 1;
    if(PlayerWeapon[playerid][pWeapons][1] != 6 && GetPlayerWeapon(playerid) == 6) return 1;
    if(PlayerWeapon[playerid][pWeapons][1] != 7 && GetPlayerWeapon(playerid) == 7) return 1;
    if(PlayerWeapon[playerid][pWeapons][1] != 8 && GetPlayerWeapon(playerid) == 8) return 1;
    if(PlayerWeapon[playerid][pWeapons][1] != 9 && GetPlayerWeapon(playerid) == 9) return 1;

    if(PlayerWeapon[playerid][pWeapons][2] != 22 && GetPlayerWeapon(playerid) == 22) return 1;
    if(PlayerWeapon[playerid][pWeapons][2] != 23 && GetPlayerWeapon(playerid) == 23) return 1;
    if(PlayerWeapon[playerid][pWeapons][2] != 24 && GetPlayerWeapon(playerid) == 24) return 1;
    if(PlayerWeapon[playerid][pWeapons][3] != 25 && GetPlayerWeapon(playerid) == 25) return 1;
    if(PlayerWeapon[playerid][pWeapons][3] != 26 && GetPlayerWeapon(playerid) == 26) return 1;
    if(PlayerWeapon[playerid][pWeapons][3] != 27 && GetPlayerWeapon(playerid) == 27) return 1;
    if(PlayerWeapon[playerid][pWeapons][4] != 28 && GetPlayerWeapon(playerid) == 28) return 1;
    if(PlayerWeapon[playerid][pWeapons][4] != 29 && GetPlayerWeapon(playerid) == 29) return 1;
    if(PlayerWeapon[playerid][pWeapons][4] != 32 && GetPlayerWeapon(playerid) == 32) return 1;
    if(PlayerWeapon[playerid][pWeapons][5] != 30 && GetPlayerWeapon(playerid) == 30) return 1;
    if(PlayerWeapon[playerid][pWeapons][5] != 31 && GetPlayerWeapon(playerid) == 31) return 1;
    if(PlayerWeapon[playerid][pWeapons][6] != 33 && GetPlayerWeapon(playerid) == 33) return 1;
    if(PlayerWeapon[playerid][pWeapons][6] != 34 && GetPlayerWeapon(playerid) == 34) return 1;
    if(PlayerWeapon[playerid][pWeapons][7] != 35 && GetPlayerWeapon(playerid) == 35) return 1;
    if(PlayerWeapon[playerid][pWeapons][7] != 36 && GetPlayerWeapon(playerid) == 36) return 1;
    if(PlayerWeapon[playerid][pWeapons][7] != 37 && GetPlayerWeapon(playerid) == 37) return 1;
    if(PlayerWeapon[playerid][pWeapons][7] != 38 && GetPlayerWeapon(playerid) == 38) return 1;

    if(PlayerWeapon[playerid][pWeapons][8] != 16 && GetPlayerWeapon(playerid) == 16) return 1;
    if(PlayerWeapon[playerid][pWeapons][8] != 17 && GetPlayerWeapon(playerid) == 17) return 1;
    if(PlayerWeapon[playerid][pWeapons][8] != 18 && GetPlayerWeapon(playerid) == 18) return 1;
    if(PlayerWeapon[playerid][pWeapons][8] != 39 && GetPlayerWeapon(playerid) == 39) return 1;

    if(PlayerWeapon[playerid][pWeapons][9] != 41 && GetPlayerWeapon(playerid) == 41) return 1;
    if(PlayerWeapon[playerid][pWeapons][9] != 42 && GetPlayerWeapon(playerid) == 42) return 1;
    if(PlayerWeapon[playerid][pWeapons][9] != 43 && GetPlayerWeapon(playerid) == 43) return 1;

    if(PlayerWeapon[playerid][pWeapons][10] != 10 && GetPlayerWeapon(playerid) == 10) return 1;
    if(PlayerWeapon[playerid][pWeapons][10] != 11 && GetPlayerWeapon(playerid) == 11) return 1;
    if(PlayerWeapon[playerid][pWeapons][10] != 12 && GetPlayerWeapon(playerid) == 12) return 1;
    if(PlayerWeapon[playerid][pWeapons][10] != 13 && GetPlayerWeapon(playerid) == 13) return 1;
    if(PlayerWeapon[playerid][pWeapons][10] != 14 && GetPlayerWeapon(playerid) == 14) return 1;
    if(PlayerWeapon[playerid][pWeapons][10] != 15 && GetPlayerWeapon(playerid) == 15) return 1;

    if(PlayerWeapon[playerid][pWeapons][11] != 44 && GetPlayerWeapon(playerid) == 44) return 1;
    if(PlayerWeapon[playerid][pWeapons][11] != 45 && GetPlayerWeapon(playerid) == 45) return 1;
    if(PlayerWeapon[playerid][pWeapons][11] != 46 && GetPlayerWeapon(playerid) == 46) return 1;

    if(PlayerWeapon[playerid][pWeapons][12] != 40 && GetPlayerWeapon(playerid) == 40) return 1;
    return 0;    
}

ptask Player_ServerWeapon[1000](playerid)
{
    if(GetPlayerWeapon(playerid) >= 1) 
    {
        if(CheckPlayerWeapon(playerid))
        {
            SendAdminMessage(X11_LIGHTSKYBLUE1, "Anti-Cheat: %s has been kicked for "YELLOW"weapon hack", ReturnName(playerid));
            KickEx(playerid, 300);
        }
    }
    return 1;
}