/*==============================================================================
    Server Variable
==============================================================================*/
new MySQL:g_iHandle;

new g_MysqlRaceCheck[MAX_PLAYERS];
new total_vehicles_from_files;
new Static_Pickup[MAX_STATIC_PICKUP];

//SA-MP Fixes
new Player_LastAnimation[MAX_PLAYERS];

/*==============================================================================
    Server Function Prototype
==============================================================================*/
forward OnPlayerLogin(playerid);
forward OnGameModeInitEx();