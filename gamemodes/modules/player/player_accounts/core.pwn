enum E_CHARACTER_DATA
{
    pID,
    pUsername[MAX_PLAYER_NAME+1],
    pSalt[65],
    pPassword[65],
    pIP[20],
    pRegisterDate,
    
    Float:pExp,
    pScore,
    pMoney,
    pAdmin,
    
    pTeam,
    pSkin,
    pKill,
    pDeath,

    pClan,
    pClanRank,

    pVehicle,

    Float:pHeadshot,
    pMMR,
    
    Float:pHealth,
    Float:pArmour,
    Float:MaxHealth,
    Float:MaxArmour
};

new PlayerData[MAX_PLAYERS][E_CHARACTER_DATA];

// Player Variables
new
    Timer:Player_LoginTimer[MAX_PLAYERS],
    Player_LoginAttempts[MAX_PLAYERS],
    Player_Logged[MAX_PLAYERS],
    Player_Kicked[MAX_PLAYERS],
    Player_MMR[MAX_PLAYERS]
;