#include <YSI\y_hooks>

forward OnCheatDetected(playerid, ip_address[], type, code);
public OnCheatDetected(playerid, ip_address[], type, code)
{
    if(!IsPlayerConnected(playerid) && IsPlayerLogged(playerid))
        return 0;

	SendAdminMessage(X11_LIGHTSKYBLUE1, "Anti-Cheat: %s Possible hack: "YELLOW"%s.", ReturnName(playerid), GetAntiCheatName(code));
    return 1;
}

stock GetAntiCheatName(code)
{
    new
        string[32];

    switch(code)
    {
        case 0: string = "Airbreak";
        case 1: string = "Airbreak(Vehicle)";
        case 2 .. 6: string = "Teleport";
        case 7, 8: string = "Flyhack";
        case 9, 10: string = "Speedhack";
        case 11: string = "Health Hack(Vehicle)";
        case 12: string = "Health Hack";
        case 13: string = "Armour Hack";
        case 14: string = "Money Hack";
        case 15: string = "Weapon Hack";
        case 16 .. 17: string = "Ammo Hack";
        case 18: string = "Anim";
        case 19 .. 20: string = "Godmode";
        case 21: string = "Invisible";
        case 22: string = "lagcomp-spoof";
        case 23: string = "Tuning Hack";
        case 24: string = "Parkour";
        case 25: string = "Quick-turn";
        case 26: string = "Rapid Fire";
        case 27: string = "Fakespawn";
        case 28: string = "Fakekill";
        case 29: string = "Pro Aim";
        case 30: string = "CJ Run";
        case 31: string = "Carshot";
        case 32: string = "Carjack";
        case 33: string = "Anti-Unfreeze";
        case 34: string = "Full Aiming";
        case 36: string = "Fake NPC";
        case 37: string = "Reconnect";
        case 38: string = "High Ping";
        case 39: string = "Dialog Hack";
        case 40: string = "Sandbox";
        case 41: string = "Invalid version";
        case 42: string = "RCON Hack";
        case 43: string = "Tuning Crasher";
        case 44: string = "Invalid seat";
        case 45: string = "Dialog Crasher";
        case 46: string = "Attach Obj. Crash";
        case 47: string = "Weapon Crasher";
        case 48: string = "Flood connect";
        case 49: string = "Flood func.";
        case 50: string = "Flood Seat";
        case 51: string = "DDOS";
        case 52: string = "NOPs";
    }
    return string;
}

// ptask Player_AntiCheat[1000](playerid)
// {
// 	new weaponid = GetPlayerWeapon(playerid);
// 	switch(weaponid)
// 	{
// 		case 1..23: SendAdminMessage(X11_LIGHTSKYBLUE1, "Anticheat: %s kicked by BOT for: "YELLOW"weapon hack.", ReturnName(playerid)), KickEx(playerid);
// 		case 25, 28, 33, 36..45: SendAdminMessage(X11_LIGHTSKYBLUE1, "Anticheat: %s kicked by BOT for: "YELLOW"weapon hack.", ReturnName(playerid)), KickEx(playerid);
// 	}
// 	return 1;
// }