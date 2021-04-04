/*==============================================================================
    Server Array
==============================================================================*/
new g_arrWeaponModels[47] =
{
    0,   // WEAPON_NONE (Weapon ID: 0)
    331, // WEAPON_BRASSKNUCKLE (Weapon ID: 1)
    333, // WEAPON_GOLFCLUB (Weapon ID: 2)
    334, // WEAPON_NITESTICK (Weapon ID: 3)
    335, // WEAPON_KNIFE (Weapon ID: 4)
    336, // WEAPON_BAT (Weapon ID: 5)
    337, // WEAPON_SHOVEL (Weapon ID: 6)
    338, // WEAPON_POOLSTICK (Weapon ID: 7)
    339, // WEAPON_KATANA (Weapon ID: 8)
    341, // WEAPON_CHAINSAW (Weapon ID: 9)
    321, // WEAPON_DILDO (Weapon ID: 10)
    322, // WEAPON_DILDO2 (Weapon ID: 11)
    323, // WEAPON_VIBRATOR (Weapon ID: 12)
    324, // WEAPON_VIBRATOR2 (Weapon ID: 13)
    325, // WEAPON_FLOWER (Weapon ID: 14)
    326, // WEAPON_CANE (Weapon ID: 15)
    342, // WEAPON_GRENADE (Weapon ID: 16)
    343, // WEAPON_TEARGAS (Weapon ID: 17)
    344, // WEAPON_MOLTOV (Weapon ID: 18)
    0,   // WEAPON_UNUSED (Weapon ID: 19)
    0,   // WEAPON_UNUSED (Weapon ID: 20)
    0,   // WEAPON_UNUSED (Weapon ID: 21)
    346, // WEAPON_COLT45 (Weapon ID: 22)
    347, // WEAPON_SILENCED (Weapon ID: 23)
    348, // WEAPON_DEAGLE (Weapon ID: 24)
    349, // WEAPON_SHOTGUN (Weapon ID: 25)
    350, // WEAPON_SAWEDOFF (Weapon ID: 26)
    351, // WEAPON_SHOTGSPA (Weapon ID: 27)
    352, // WEAPON_UZI (Weapon ID: 28)
    353, // WEAPON_MP5 (Weapon ID: 29)
    355, // WEAPON_AK47 (Weapon ID: 30)
    356, // WEAPON_M4 (Weapon ID: 31)
    372, // WEAPON_TEC9 (Weapon ID: 32)
    357, // WEAPON_RIFLE (Weapon ID: 33)
    358, // WEAPON_SNIPER (Weapon ID: 34)
    359, // WEAPON_ROCKETLAUNCHER (Weapon ID: 35)
    360, // WEAPON_HEATSEEKER (Weapon ID: 36)
    361, // WEAPON_FLAMETHROWER (Weapon ID: 37)
    362, // WEAPON_MINIGUN (Weapon ID: 38)
    363, // WEAPON_SATCHEL (Weapon ID: 39)
    364, // WEAPON_BOMB (Weapon ID: 40)
    365, // WEAPON_SPRAYCAN (Weapon ID: 41)
    366, // WEAPON_FIREEXTINGUISHER (Weapon ID: 42)
    367, // WEAPON_CAMERA (Weapon ID: 43)
    368, // WEAPON_NV_GOGGLES (Weapon ID: 44)
    369, // WEAPON_THERMAL_GOGGLES (Weapon ID: 45)
    371  // WEAPON_PARACHUTE (Weapon ID: 46)
};

stock const g_aPreloadLibs[][] =
{
    "AIRPORT",      "ATTRACTORS",   "BAR",          "BASEBALL",     "BD_FIRE",
    "BEACH",        "BENCHPRESS",   "BF_INJECTION", "BIKE_DBZ",     "BIKED",
    "BIKEH",        "BIKELEAP",     "BIKES",        "BIKEV",        "BLOWJOBZ",
    "BMX",          "BOMBER",       "BOX",          "BSKTBALL",     "BUDDY",
    "BUS",          "CAMERA",       "CAR",          "CAR_CHAT",     "CARRY",
    "CASINO",       "CHAINSAW",     "CHOPPA",       "CLOTHES",      "COACH",
    "COLT45",       "COP_AMBIENT",  "COP_DVBYZ",    "CRACK",        "CRIB",
    "DAM_JUMP",     "DANCING",      "DEALER",       "DILDO",        "DODGE",
    "DOZER",        "DRIVEBYS",     "FAT",          "FIGHT_B",      "FIGHT_C",
    "FIGHT_D",      "FIGHT_E",      "FINALE",       "FINALE2",      "FLAME",
    "FLOWERS",      "FOOD",         "FREEWEIGHTS",  "GANGS",        "GFUNK",
    "GHANDS",       "GHETTO_DB",    "GOGGLES",      "GRAFFITI",     "GRAVEYARD",
    "GRENADE",      "GYMNASIUM",    "HAIRCUTS",     "HEIST9",       "INT_HOUSE",
    "INT_OFFICE",   "INT_SHOP",     "JST_BUISNESS", "KART",         "KISSING",
    "KNIFE",        "LAPDAN1",      "LAPDAN2",      "LAPDAN3",      "LOWRIDER",
    "MD_CHASE",     "MD_END",       "MEDIC",        "MISC",         "MTB",
    "MUSCULAR",     "NEVADA",       "ON_LOOKERS",   "OTB",          "PARACHUTE",
    "PARK",         "PAULNMAC",     "PED",          "PLAYER_DVBYS", "PLAYIDLES",
    "POLICE",       "POOL",         "POOR",         "PYTHON",       "QUAD",
    "QUAD_DBZ",     "RAPPING",      "RIFLE",        "RIOT",         "ROB_BANK",
    "ROCKET",       "RUNNINGMAN",   "RUSTLER",      "RYDER",        "SCRATCHING",
    "SEX",          "SHAMAL",       "SHOP",         "SHOTGUN",      "SILENCED",
    "SKATE",        "SMOKING",      "SNIPER",       "SNM",          "SPRAYCAN",
    "STRIP",        "SUNBATHE",     "SWAT",         "SWEET",        "SWIM",
    "SWORD",        "TANK",         "TATTOOS",      "TEC",          "TRAIN",
    "TRUCK",        "UZI",          "VAN",          "VENDING",      "VORTEX",
    "WAYFARER",     "WEAPONS",      "WOP",          "WUZI"
};

stock const g_arrVehicleNames[][] = {
    "Landstalker", "Bravura", "Buffalo", "Linerunner", "Perrenial", "Sentinel", "Dumper", "Firetruck", "Trashmaster",
    "Stretch", "Manana", "Infernus", "Voodoo", "Pony", "Mule", "Cheetah", "Ambulance", "Leviathan", "Moonbeam",
    "Esperanto", "Taxi", "Washington", "Bobcat", "Whoopee", "BF Injection", "Hunter", "Premier", "Enforcer",
    "Securicar", "Banshee", "Predator", "Bus", "Rhino", "Barracks", "Hotknife", "Trailer", "Previon", "Coach",
    "Cabbie", "Stallion", "Rumpo", "RC Bandit", "Romero", "Packer", "Monster", "Admiral", "Squalo", "Seasparrow",
    "Pizzaboy", "Tram", "Trailer", "Turismo", "Speeder", "Reefer", "Tropic", "Flatbed", "Yankee", "Caddy", "Solair",
    "Berkley's RC Van", "Skimmer", "PCJ-600", "Faggio", "Freeway", "RC Baron", "RC Raider", "Glendale", "Oceanic",
    "Sanchez", "Sparrow", "Patriot", "Quad", "Coastguard", "Dinghy", "Hermes", "Sabre", "Rustler", "ZR-350", "Walton",
    "Regina", "Comet", "BMX", "Burrito", "Camper", "Marquis", "Baggage", "Dozer", "Maverick", "News Chopper", "Rancher",
    "FBI Rancher", "Virgo", "Greenwood", "Jetmax", "Hotring", "Sandking", "Blista Compact", "Police Maverick",
    "Boxville", "Benson", "Mesa", "RC Goblin", "Hotring Racer A", "Hotring Racer B", "Bloodring Banger", "Rancher",
    "Super GT", "Elegant", "Journey", "Bike", "Mountain Bike", "Beagle", "Cropduster", "Stunt", "Tanker", "Roadtrain",
    "Nebula", "Majestic", "Buccaneer", "Shamal", "Hydra", "FCR-900", "NRG-500", "HPV1000", "Cement Truck", "Tow Truck",
    "Fortune", "Cadrona", "SWAT Truck", "Willard", "Forklift", "Tractor", "Combine", "Feltzer", "Remington", "Slamvan",
    "Blade", "Streak", "Freight", "Vortex", "Vincent", "Bullet", "Clover", "Sadler", "Firetruck", "Hustler", "Intruder",
    "Primo", "Cargobob", "Tampa", "Sunrise", "Merit", "Utility", "Nevada", "Yosemite", "Windsor", "Monster", "Monster",
    "Uranus", "Jester", "Sultan", "Stratum", "Elegy", "Raindance", "RC Tiger", "Flash", "Tahoma", "Savanna", "Bandito",
    "Freight Flat", "Streak Carriage", "Kart", "Mower", "Dune", "Sweeper", "Broadway", "Tornado", "AT-400", "DFT-30",
    "Huntley", "Stafford", "BF-400", "News Van", "Tug", "Trailer", "Emperor", "Wayfarer", "Euros", "Hotdog", "Club",
    "Freight Box", "Trailer", "Andromada", "Dodo", "RC Cam", "Launch", "LSPD Car", "SFPD Car", "LVPD Car",
    "Police Rancher", "Picador", "S.W.A.T", "Alpha", "Phoenix", "Glendale", "Sadler", "Luggage", "Luggage", "Stairs",
    "Boxville", "Tiller", "Utility Trailer"
};


new Float:RandomSpawn_LosSantos[][4] = {
    {1751.1097,-2106.4529,13.5469,183.1979}, // El-Corona - Outside random house
    {2652.6418,-1989.9175,13.9988,182.7107}, // Random house in willowfield - near playa de seville and stadium
    {2489.5225,-1957.9258,13.5881,2.3440}, // Hotel in willowfield - near cluckin bell
    {2689.5203,-1695.9354,10.0517,39.5312}, // Outside stadium - lots of cars
    {2770.5393,-1628.3069,12.1775,4.9637}, // South in east beach - north of stadium - carparks nearby
    {2807.9282,-1176.8883,25.3805,173.6018}, // North in east beach - near apartments
    {2552.5417,-958.0850,82.6345,280.2542}, // Random house north of Las Colinas
    {2232.1309,-1159.5679,25.8906,103.2939}, // Jefferson motel
    {2388.1003,-1279.8933,25.1291,94.3321}, // House south of pig pen
    {2481.1885,-1536.7186,24.1467,273.4944}, // East LS - near clucking bell and car wash
    {2495.0720,-1687.5278,13.5150,359.6696}, // Outside CJ's house - lots of cars nearby
    {2306.8252,-1675.4340,13.9221,2.6271}, // House in ganton - lots of cars nearby
    {2191.8403,-1455.8251,25.5391,267.9925}, // House in south jefferson - lots of cars nearby
    {1830.1359,-1092.1849,23.8656,94.0113}, // Mulholland intersection carpark
    {2015.3630,-1717.2535,13.5547,93.3655}, // Idlewood house
    {1654.7091,-1656.8516,22.5156,177.9729}, // Right next to PD
    {1219.0851,-1812.8058,16.5938,190.0045}, // Conference Center
    {1508.6849,-1059.0846,25.0625,1.8058}, // Across the street of BANK - lots of cars in intersection carpark
    {1421.0819,-885.3383,50.6531,3.6516}, // Outside house in vinewood
    {1133.8237,-1272.1558,13.5469,192.4113}, // Near hospital
    {1235.2196,-1608.6111,13.5469,181.2655}, // Backalley west of mainstreet
    {590.4648,-1252.2269,18.2116,25.0473}, // Outside "BAnk of San Andreas"
    {842.5260,-1007.7679,28.4185,213.9953}, // North of Graveyard
    {911.9332,-1232.6490,16.9766,5.2999}, // LS Film Studio
    {477.6021,-1496.6207,20.4345,266.9252}, // Rodeo Place
    {255.4621,-1366.3256,53.1094,312.0852}, // Outside propery in richman
    {281.5446,-1261.4562,73.9319,305.0017}, // Another richman property
    {790.1918,-839.8533,60.6328,191.9514}, // Mulholland house
    {1299.1859,-801.4249,84.1406,269.5274}, // Maddoggs
    {1240.3170,-2036.6886,59.9575,276.4659}, // Verdant Bluffs
    {2215.5181,-2627.8174,13.5469,273.7786}, // Ocean docks 1
    {2509.4346,-2637.6543,13.6453,358.3565} // Ocean Docks spawn 2
};

enum E_RANDOM_PICKUP
{
    random_Pickupmodel,
    Float:random_Pickupx,
    Float:random_Pickupy,
    Float:random_Pickupz
};

new RandomClan_Color[][0] = { 
    {0xFFFAFAAA}, {0xF8F8FFAA}, {0xF8F8FFAA}, {0xF5F5F5AA}, {0xF5F5F5AA}, {0xDCDCDCAA}, 
    {0xFFFAF0AA}, {0xFFFAF0AA}, {0xFDF5E6AA}, {0xFDF5E6AA}, {0xFAF0E6AA}, {0xFAEBD7AA}, 
    {0xFAEBD7AA}, {0xFFEFD5AA}, {0xFFEFD5AA}, {0xFFEBCDAA}, {0xFFEBCDAA}, {0xFFE4C4AA}, 
    {0xFFDAB9AA}, {0xFFDAB9AA}, {0xFFDEADAA}, {0xFFDEADAA}, {0xFFE4B5AA}, {0xFFF8DCAA}, 
    {0xFFFFF0AA}, {0xFFFACDAA}, {0xFFFACDAA}, {0xFFF5EEAA}, {0xF0FFF0AA}, {0xF5FFFAAA}, 
    {0xF5FFFAAA}, {0xF0FFFFAA}, {0xF0F8FFAA}, {0xF0F8FFAA}, {0xE6E6FAAA}, {0xFFF0F5AA}, 
    {0xFFF0F5AA}, {0xFFE4E1AA}, {0xFFE4E1AA}, {0xFFFFFFAA}, {0x000000AA}, {0x2F4F4FAA}, 
    {0x2F4F4FAA}, {0x2F4F4FAA}, {0x2F4F4FAA}, {0x696969AA}, {0x696969AA}, {0x696969AA}, 
    {0x696969AA}, {0x708090AA}, {0x708090AA}, {0x708090AA}, {0x708090AA}, {0x778899AA}, 
    {0x778899AA}, {0x778899AA}, {0x778899AA}, {0xBEBEBEAA}, {0xBEBEBEAA}, {0xD3D3D3AA}, 
    {0xD3D3D3AA}, {0xD3D3D3AA}, {0xD3D3D3AA}, {0x191970AA}, {0x191970AA}, {0x000080AA}, 
    {0x000080AA}, {0x000080AA}, {0x6495EDAA}, {0x6495EDAA}, {0x483D8BAA}, {0x483D8BAA}, 
    {0x6A5ACDAA}, {0x6A5ACDAA}, {0x7B68EEAA}, {0x7B68EEAA}, {0x8470FFAA}, {0x8470FFAA},
    {0x0000CDAA}, {0x0000CDAA}, {0x4169E1AA}, {0x4169E1AA}, {0x0000FFAA}, {0x1E90FFAA}, 
    {0x1E90FFAA}, {0x00BFFFAA}, {0x00BFFFAA}, {0x87CEEBAA}, {0x87CEEBAA}, {0x87CEFAAA}, 
    {0x87CEFAAA}, {0x4682B4AA}, {0x4682B4AA}, {0xB0C4DEAA}, {0xB0C4DEAA}, {0xADD8E6AA}, 
    {0xADD8E6AA}, {0xB0E0E6AA}, {0xB0E0E6AA}, {0xAFEEEEAA}, {0xAFEEEEAA}, {0x00CED1AA}, 
    {0x00CED1AA}, {0x48D1CCAA}, {0x48D1CCAA}, {0x40E0D0AA}, {0x00FFFFAA}, {0xE0FFFFAA}, 
    {0xE0FFFFAA}, {0x5F9EA0AA}, {0x5F9EA0AA}, {0x66CDAAAA}, {0x66CDAAAA}, {0x7FFFD4AA}, 
    {0x006400AA}, {0x006400AA}, {0x556B2FAA}, {0x556B2FAA}, {0x8FBC8FAA}, {0x8FBC8FAA}, 
    {0x2E8B57AA}, {0x2E8B57AA}, {0x3CB371AA}, {0x3CB371AA}, {0x20B2AAAA}, {0x20B2AAAA}, 
    {0x98FB98AA}, {0x98FB98AA}, {0x00FF7FAA}, {0x00FF7FAA}, {0x7CFC00AA}, {0x7CFC00AA}
};

new RandomSpawn_PickupLS[][E_RANDOM_PICKUP] = {
    {372, 327.8443,     -1809.2729,4.5733}, 
    {372, 311.7234,     -1809.8577,4.3552}, 
    {372, 334.3875,     -1788.6018,4.7803}, 
    {1242, 2545.0,      -1624.2998, 10.5},
    {346,  2535.8999,   -1632.4, 13.8},
    {358,  2509.3,      -1722.0, 18.6},
    {358,  2070.7,      -1826.6, 22.5},
    {1242, 1580.0,      -1634.7, 13.6},
    {351,  1611.2,      -1720.9, 6.2},
    {1240, 2140.2,      -2283.2, 20.7},
    {1242, 2139.7,      -2289.0, 20.7},
    {336,  2284.7,      -1643.6, 15.2},
    {358,  730.59998,   -1276.1, 17.6},
    {362,  243.8,       -1097.1, 87.3},
    {358,  1117.8,      -2036.9, 78.8},
    {370,  1526.4,      -1346.5, 330.0},
    {358,  1405.2,      -807.20001, 85.0},
    {1240, 1177.1,      -1333.7, 14.0},
    {1240, 925.29999,   -1356.0, 13.4},
    {1240, 1033.3,      -1338.6, 13.7},
    {1240, 802.40002,   -1630.3, 13.4},
    {1240, 2103.10010,  -1803.5, 13.6},
    {1242, 2007.7,      -2066.7, 17.4},
    {1240, 2205.5,      -2212.7, 15.2},
    {1240, 2198.0,      -2220.1001, 15.2},
    {1240, 2191.2,      -2227.8, 15.2},
    {1240, 2213.1001,   -2206.3, 15.2},
    {1242, 2176.3,      -2235.5, 15.8},
    {339,  2252.2,      -2280.7, 14.8},
    {358,  1482.7,      -1389.2, 62.4},
    {1242, 613.2999900, -609.5999800, 17.2},
    {362,  664.9000200, -569.2000100, 16.3},
    {341,  1105.6,      -301.7999900, 74.5},
    {1240, 1364.9,      249.6000100, 19.6},
    {1240, 2335.2,      75.5, 26.5},
    {1242, 2329.8,      62.9, 32.0},
    {337,  2240.3,      -70.9, 26.5},
    {1240, 1197.1,      -919.0, 43.1},
    {355,  2512.8999,   -957.2999900, 82.3},
    {1242, 2485.5,      -1711.9, 13.5},
    {337,  2456.6001,   -1708.3, 13.6},
    {353,  1624.1,      -1080.5, 23.9},
    {355,  1625.5,      -1040.9, 23.9},
    {358,  1083.3,      -2036.7, 69.0},
    {1242, 674.5,       -1870.0, 5.5},
    {356,  673.7999900, -1864.7, 5.5},
    {1240, 389.2000100, -2073.1001, 7.8},
    {350,  401.6000100, -2069.3, 10.7},
    {358,  349.7000100, -1305.3, 50.8},
    {366,  1939.2,      -1772.7, 13.4},
    {1242, 815.5999800, -1093.3, 25.8},
    {372,  2349.1824,   -2000.2684, 13.2666}, 
    {352,  1775.6141,   -1860.0100, 13.2745},
    {353,  2393.2522,   -1927.3457,13.2782}, 
    {359,  2383.3689,   -1928.1165,13.1844},
    {344,  1748.9358,   -1859.9502,13.2721}, 
    {342,  1734.6754,   -1859.9305,13.2740},    
    {1240, 1411.2491,   -2347.3430,13.2101}, 
    {1240, 1391.5173,   -2364.2131,13.2633}, 
    {1240, 1365.7269,   -2351.5515,13.1069}
};
