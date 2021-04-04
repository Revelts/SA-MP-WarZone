/*==============================================================================
    Script Information:
    * Development by: Leynardo Yosef (Revelt)
    * Base Script: Scratch
    * Current Version: V1.0

    Other Credits:

    * Kalcor (Kye) SAMP Developer
    * Y_Less (sscanf, YSI, and other function)
    * BlueG, maddinat0r (a_mysql plugin)
    * Southclaw (Progressbar2, and other function)
    * Incognito, Zeex, and much more contribution on samp forum.
    

    Copyright(c) 2020 Leynardo Yosef (Revelt) (All rights reserved).
==============================================================================*/

/*==============================================================================
    Library Predefinitions
==============================================================================*/
#pragma dynamic 500000

#include <a_samp>                   //Credits to SA-MP


/*==============================================================================
    Librarys
==============================================================================*/

#include <Pawn.RakNet>
#include <streamer>                 //by Incognito
#include <sscanf2>                  //by Y_Less fixed by maddinat0r & Emmet_
#include <a_mysql>
#include <chrono>                   //by Southclaws
#include <crashdetect>              //by Zeex

#include <YSI\y_timers>             //by Y_Less from YSI
#include <YSI\y_iterate>            //by Y_Less from YSI
#include <YSI\y_hooks>              //by Y_Less from YSI
#include <YSI\y_colours>            //by Y_Less from YSI
#include <YSI\y_vehicledata>        //by Y_Less from YSI

#include <nex-ac>                   //BY Nexus
#include <strlib>                   //by Slice
#include <easyDialog>               //by Emmet_
#include <izcmd>                    //by Zeex
#include <lookup>
#include <progress2>                //by Southclaws
#include <wep-config>               //by Revelt

/*==============================================================================
    Server Setup modules
==============================================================================*/

#include "modules\server\server_settings.pwn"

/*==============================================================================
    Player Module Script
==============================================================================*/

#include "modules\player\player_settings.pwn"
#include "modules\server\server_side.pwn"
#include "modules\player\player_class.pwn"
#include "modules\player\player_commands.pwn"
#include "modules\player\player_clan.pwn"
#include "modules\player\player_statistic.pwn"
#include "modules\player\player_visual.pwn"

/*==============================================================================
    Admin Module Script
==============================================================================*/

#include "modules\admin\admin_commands.pwn"

/*==============================================================================
    Vehicle Module Script
==============================================================================*/

#include "modules\vehicle\vehicle_spawner.pwn"

/*==============================================================================
    Module Mapping
==============================================================================*/

// #include "modules\server\server_mapping.pwn"

/*==============================================================================
    Initialising OnGameModeInit
==============================================================================*/

public OnGameModeInit()
{
    UsePlayerPedAnims();
    LoadServerVehicles();
    LoadServerPickup();
    DisableInteriorEnterExits();
    SetGameModeText(SERVER_VERSION);
    ShowPlayerMarkers(1);
    EnableStuntBonusForAll(0);
    MySqlStartConnection();
    CallLocalFunction("OnGameModeInitEx", "");
    return 1;
}

/*==============================================================================
    Initialising OnGameModeExit
==============================================================================*/

public OnGameModeExit()
{
    foreach(new i : Player)
    {
        SQL_SaveAccount(i);
    }
    MySqlCloseConnection();
    return 1;
}

/*==============================================================================
    Server Function
==============================================================================*/


stock KickEx(playerid, time = 200)
{
    if(IsPlayerKicked(playerid))
        return 0;

    if(IsPlayerLogged(playerid))
    {
        SQL_SaveAccount(playerid);
    }    
    Player_Kicked[playerid] = 1;
    defer KickPlayer[time](playerid);
    return 1;
}

timer KickPlayer[200](playerid)
{
    if(IsPlayerKicked(playerid))
    {
        return Kick(playerid);
    }
    return 1;
}

InflictDamage(playerid, issuerid, Float:amount, Float:health, Float:armour)
{
    new string[1024];
    if(armour > 0) SetPlayerArmourEx(playerid, armour-amount);
    else SetPlayerHealthEx(playerid, health-amount);
    PlayerPlaySound(issuerid, 17802, 0.0, 0.0, 0.0);

    format(string, sizeof(string), "~y~%s~w~ DAMAGE: ~w~%.2f~w~ TEAM: %s~n~~w~H: %.2f~w~A: %.2f",
        ReturnName(playerid), 
        amount, 
        (GetPlayerTeam(issuerid) == GetPlayerTeam(playerid)) ? ("~g~YES") : ("~r~ENEMY"),
        GetPlayerHealthEx(playerid),
        GetPlayerArmourEx(playerid)
    );
    ShowPlayerFooter(issuerid, string);
    return 1;
}

/*==============================================================================
    Callback
==============================================================================*/
public OnPlayerSpawn(playerid)
{
    GiveDefaultWeapon(playerid);
    return 1;
}

public OnPlayerCommandReceived(playerid, cmdtext[])
{
    printf("[CMD] [%s]: %s", ReturnName(playerid), cmdtext);
    return 1;
}
public OnPlayerCommandPerformed(playerid, cmdtext[], success)
{
    new 
        bool:cmdTextLimit = false;

    if (strlen(cmdtext) > 20) {
        cmdtext[20] = EOS;
        cmdTextLimit = true;
    }
    
    if(!success)
        return SendErrorMessage(playerid, ""WHITE"Perintah '%s%s' tidak terdaftar pada server, gunakan (/help).",cmdtext, (cmdTextLimit) ? ("...") : (""));
    
    return 1;
}

public OnPlayerConnect(playerid)
{
    ResetStatistics(playerid);
    PreloadAnimations(playerid);
    g_MysqlRaceCheck[playerid]++;
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    if(IsValidVehicle(PlayerData[playerid][pVehicle]))
        DestroyVehicle(PlayerData[playerid][pVehicle]);

    g_MysqlRaceCheck[playerid]++;
    TerminateConnection(playerid);
    return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
    new
        Float:x,
        Float:y,
        Float:z
    ;

    GetPlayerPos(playerid, x, y, z);
    RemoveBuildingForPlayer(playerid, 1484, x, y, z, 10.0);
    RemoveBuildingForPlayer(playerid, 1485, x, y, z, 10.0);
    RemoveBuildingForPlayer(playerid, 1486, x, y, z, 10.0);
    
    if(IsValidNickName(ReturnName(playerid)))
    {
        SendErrorMessage(playerid, "Special Karakter ']' dan '[' tidak di perbolehkan!");
        KickEx(playerid);
    }

    foreach(new i : Player)
    {
        if(PlayerData[i][pUsername][0] != EOS)
        {
            if(!strcmp(PlayerData[i][pUsername], ReturnName(playerid)) && i != playerid)
            {
                SendErrorMessage(playerid, "Seseorang sedang login menggunakan nama yang sama.");
                KickEx(playerid);
            }
        }
    }

    if(!IsPlayerKicked(playerid))
    {
        SetPVarInt(playerid, "IPBanned", 1);

        if(!ScriptBan_Check(playerid, "IP", ReturnIP(playerid))) 
        {
            DeletePVar(playerid, "IPBanned");

            TogglePlayerSpectating(playerid, 1);
            SQL_CheckAccount(playerid);
        }
    }
    return 1;
}

public OnPlayerRequestSpawn(playerid)
{
    if(!IsPlayerLogged(playerid))
    {
        KickEx(playerid);
        return 0;
    }
    return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
    new
        Float:health = GetPlayerHealthEx(playerid),
        Float:armour = GetPlayerArmourEx(playerid),
        playerid_team = GetPlayerTeamEx(playerid)
    ;
    if(issuerid != INVALID_PLAYER_ID)
    {
        new 
            issuerid_team = GetPlayerTeamEx(issuerid)
        ;
        if(playerid_team != issuerid_team || playerid_team == NO_TEAM || issuerid_team == NO_TEAM)
        {
            if(GetPlayerClass(issuerid) == CLASS_ASSAULT)
            {
                new Float:multiplier_damage = amount*3.0;
                switch(weaponid)
                {
                    case WEAPON_AK47: InflictDamage(playerid, issuerid, multiplier_damage, health, armour);
                    case WEAPON_M4: InflictDamage(playerid, issuerid, multiplier_damage, health, armour);
                    default: InflictDamage(playerid, issuerid, amount, health, armour);
                }
            }
            else
            {
                InflictDamage(playerid, issuerid, amount, health, armour);
            }
        }
        switch(bodypart)
        {
            case BODY_PART_HEAD: SetPlayerHeadshot(issuerid, 1.00);
            default:
            {
                SetPlayerHeadshot(issuerid, -0.02);
            }
        }
    }
    else
    {        
        SetPlayerHealthEx(playerid, health-amount);
    }
    return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(newstate == PLAYER_STATE_WASTED)
    {
        new 
            rand = random(sizeof(RandomSpawn_LosSantos)),
            team = GetPlayerTeamEx(playerid)
        ;
        SetPlayerHealthEx(playerid, GetPlayerMaxHealth(playerid));
        SetSpawnInfo(playerid, team, PlayerData[playerid][pSkin], RandomSpawn_LosSantos[rand][0], RandomSpawn_LosSantos[rand][1], RandomSpawn_LosSantos[rand][2], RandomSpawn_LosSantos[rand][3], 0, 0 ,0 ,0 ,0 ,0);
    }
    return 1;
}

public OnPlayerUpdate(playerid)
{
    if(IsPlayerKicked(playerid))
        return 0;

    Player_LastAnimation[playerid] = GetPlayerAnimationIndex(playerid);
    return 1;
}
public OnPlayerDeath(playerid, killerid, reason)
{
    static
        sAnimlib[32],
        sAnimname[32]
    ;

    GetAnimationName(Player_LastAnimation[playerid], sAnimlib, sizeof (sAnimlib), sAnimname, sizeof (sAnimname));
    if (strcmp(sAnimlib, "PED", true))
    {
        ClearAnimations(playerid);
    }

    foreach(new i : Player)
    {
        SendDeathMessageToPlayer(i, killerid, playerid, reason);
    }
    if(killerid != INVALID_PLAYER_ID)
    {
        if(IsPlayerMMR(playerid) && IsPlayerMMR(killerid))
        {
            SetPlayerMMR(playerid, -25);
            SetPlayerMMR(killerid, 25);
        }
        UpdateKillerStats(playerid, killerid);
    }
    return 1;
}

public OnPlayerText(playerid, text[])
{
    if(!IsPlayerLogged(playerid))
        return 0;

    if(IsPlayerFlooding(playerid))
    {
        SendErrorMessage(playerid, "Chat flood protection!");
        return 0;
    }
    if(text[0] == '!')
    {
        if(GetPlayerTeamEx(playerid) != 255)
        {
            SendTeamMessage(playerid, COLOR_WHITE, ""YELLOW"[Team Chat] "WHITE"%s (%d) : %s", ReturnName(playerid), playerid, text[1]);
        }
        return 0;
    }
    else if(text[0] == '@')
    {
        if(GetPlayerAdminLevel(playerid) >= 1)
        {
            SendAdminMessage(COLOR_WHITE, ""RED"[Admin Chat] "WHITE"%s (%d) : %s", ReturnName(playerid), playerid, text[1]);
        }
        return 0;
    }
    else if(text[0] == '#')
    {
        if(PlayerData[playerid][pClan] != -1)
        {
            new rank = PlayerData[playerid][pClanRank];
            SendClanMessage(playerid, COLOR_WHITE, ""LIGHTBLUE"[Clan Chat] "WHITE"%s %s (%d) : %s", GetClanRankName(rank), ReturnName(playerid), playerid, text[1]);
        }
        return 0;
    }
    SendPlayerMessageToAll(playerid, text);
    return 0;
}

public OnPlayerPickUpDynamicPickup(playerid, pickupid)
{
    new id = Streamer_GetIntData(STREAMER_TYPE_PICKUP, pickupid, E_STREAMER_EXTRA_ID);
    if(id >= 0 && id <= 389)
    {
        new modelid = RandomSpawn_PickupLS[id][random_Pickupmodel];
        switch(modelid)
        {
            case 1240: SetPlayerHealthEx(playerid, GetPlayerMaxHealth(playerid));
            case 1242: SetPlayerArmourEx(playerid, GetPlayerMaxArmour(playerid));
            case 351: GivePlayerWeaponEx(playerid, WEAPON_SHOTGSPA, 100);
            case 372: GivePlayerWeaponEx(playerid, WEAPON_TEC9, 100);
            case 356: GivePlayerWeaponEx(playerid, WEAPON_M4, 100);
            case 350: GivePlayerWeaponEx(playerid, WEAPON_SAWEDOFF, 100);
            case 358: GivePlayerWeaponEx(playerid, WEAPON_SNIPER, 100);
            case 359: GivePlayerWeaponEx(playerid, WEAPON_ROCKETLAUNCHER, 10);
            case 352: GivePlayerWeaponEx(playerid, WEAPON_UZI, 100);
            case 361: GivePlayerWeaponEx(playerid, WEAPON_FLAMETHROWER, 200);
            case 342: GivePlayerWeaponEx(playerid, WEAPON_GRENADE, 10);
            case 344: GivePlayerWeaponEx(playerid, WEAPON_MOLTOV, 20);
            case 334: GivePlayerWeaponEx(playerid, WEAPON_NITESTICK, 1);
            case 336: GivePlayerWeaponEx(playerid, WEAPON_BAT, 1);
            case 337: GivePlayerWeaponEx(playerid, WEAPON_SHOVEL, 1);
            case 339: GivePlayerWeaponEx(playerid, WEAPON_KATANA, 1);
            case 341: GivePlayerWeaponEx(playerid, WEAPON_CHAINSAW, 1);
            case 346: GivePlayerWeaponEx(playerid, WEAPON_COLT45, 100);
            case 353: GivePlayerWeaponEx(playerid, WEAPON_MP5, 100);
            case 355: GivePlayerWeaponEx(playerid, WEAPON_AK47, 100);
            case 362: GivePlayerWeaponEx(playerid, WEAPON_MINIGUN, 50);
            case 366: GivePlayerWeaponEx(playerid, WEAPON_FIREEXTINGUISHER, 100);
            case 370: GivePlayerWeaponEx(playerid, WEAPON_PARACHUTE, 1);
        }
    }
    return 1;
}

public OnPlayerLogin(playerid)
{
    if(PlayerData[playerid][pClan] != -1)
    {
        new index = Clan_ReturnIndex(playerid), string[MAX_PLAYER_NAME+1];
        if(index != INVALID_CLAN_ID)
        {
            format(string, sizeof(string), "[%s]%s", ClanData[index][clanTag], PlayerData[playerid][pUsername]);
            SetPlayerName(playerid, string);
            SetClanColor(playerid, index);
        }
    }
    SetPlayerHealthEx(playerid, GetPlayerMaxHealth(playerid));
    SetPlayerArmourEx(playerid, GetPlayerMaxArmour(playerid));
    ShowPlayerStatistics(playerid);
    SetPlayerScore(playerid, GetPlayerLevel(playerid));
    return 1;
}