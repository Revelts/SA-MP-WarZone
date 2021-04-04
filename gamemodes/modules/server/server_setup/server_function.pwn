/*==============================================================================
    Server Function
==============================================================================*/
stock GetWeaponModelIDFromWeaponID(weaponid)
{
    if (weaponid < 0 || weaponid > sizeof(g_arrWeaponModels))
    {
        return 0;
    }

    return g_arrWeaponModels[weaponid];
}

stock SendClientMessageEx(playerid, color, const text[], {Float, _}:...)
{
    static
        args,
        str[144];

    /*
         *  Custom Function:that uses #emit to format variables into a string.
         *  This code is very fragile; touching any code here will cause crashing!
    */
    if((args = numargs()) == 3)
    {
        SendClientMessage(playerid, color, text);
    }
    else
    {
        while (--args >= 3)
        {
            #emit LCTRL 5
            #emit LOAD.alt args
            #emit SHL.C.alt 2
            #emit ADD.C 12
            #emit ADD
            #emit LOAD.I
            #emit PUSH.pri
        }
        #emit PUSH.S text
        #emit PUSH.C 144
        #emit PUSH.C str
        #emit PUSH.S 8
        #emit SYSREQ.C format
        #emit LCTRL 5
        #emit SCTRL 4

        SendClientMessage(playerid, color, str);

        #emit RETN
    }
    return 1;
}

stock SendClientMessageToAllEx(color, const text[], {Float, _}:...)
{
    static
        args,
        str[144];

    /*
         *  Custom Function:that uses #emit to format variables into a string.
         *  This code is very fragile; touching any code here will cause crashing!
    */
    if((args = numargs()) == 2)
    {
        SendClientMessageToAll(color, text);
    }
    else
    {
        while (--args >= 2)
        {
            #emit LCTRL 5
            #emit LOAD.alt args
            #emit SHL.C.alt 2
            #emit ADD.C 12
            #emit ADD
            #emit LOAD.I
            #emit PUSH.pri
        }
        #emit PUSH.S text
        #emit PUSH.C 144
        #emit PUSH.C str
        #emit LOAD.S.pri 8
        #emit ADD.C 4
        #emit PUSH.pri
        #emit SYSREQ.C format
        #emit LCTRL 5
        #emit SCTRL 4

        SendClientMessageToAll(color, str);

        #emit RETN
    }
    return 1;
}


stock SendTeamMessage(playerid, color, const str[], {Float,_}:...)
{
    static
        args,
        start,
        end,
        string[144]
    ;
    #emit LOAD.S.pri 8
    #emit STOR.pri args

    if(args > 8)
    {
        #emit ADDR.pri str
        #emit STOR.pri start

        for (end = start + (args - 8); end > start; end -= 4)
        {
            #emit LREF.pri end
            #emit PUSH.pri
        }
        #emit PUSH.S str
        #emit PUSH.C 144
        #emit PUSH.C string

        #emit LOAD.S.pri 8
        #emit ADD.C 4
        #emit PUSH.pri

        #emit SYSREQ.C format
        #emit LCTRL 5
        #emit SCTRL 4

        foreach (new i : Player)
        {
            if(GetPlayerTeamEx(playerid) == GetPlayerTeamEx(i)) {
                SendClientMessage(i, color, string);
            }
        }
        return 1;
    }
    foreach (new i : Player)
    {
        if(GetPlayerTeamEx(playerid) == GetPlayerTeamEx(i)) {
            SendClientMessage(i, color, str);
        }
    }
    return 1;
}

stock SendAdminMessage(color, const str[], {Float,_}:...)
{
    static
        args,
        start,
        end,
        string[144]
    ;
    #emit LOAD.S.pri 8
    #emit STOR.pri args

    if(args > 8)
    {
        #emit ADDR.pri str
        #emit STOR.pri start

        for (end = start + (args - 8); end > start; end -= 4)
        {
            #emit LREF.pri end
            #emit PUSH.pri
        }
        #emit PUSH.S str
        #emit PUSH.C 144
        #emit PUSH.C string

        #emit LOAD.S.pri 8
        #emit ADD.C 4
        #emit PUSH.pri

        #emit SYSREQ.C format
        #emit LCTRL 5
        #emit SCTRL 4

        foreach (new i : Player)
        {
            if(GetPlayerAdminLevel(i) >= 1) {
                SendClientMessage(i, color, string);
            }
        }
        return 1;
    }
    foreach (new i : Player)
    {
        if(GetPlayerAdminLevel(i) >= 1) {
            SendClientMessage(i, color, str);
        }
    }
    return 1;
}

stock PreloadAnimations(playerid)
{
    for (new i = 0; i < sizeof(g_aPreloadLibs); i ++) {
        ApplyAnimation(playerid, g_aPreloadLibs[i], "null", 4.0, 0, 0, 0, 0, 0, 1);
    }
    return 1;
}

stock ReturnName(playerid)
{
    new
        name[MAX_PLAYER_NAME + 1]
    ;
    GetPlayerName(playerid, name, sizeof(name));
    return name;
}


stock cache_get_field_content(row, const field_name[], destination[], max_len = sizeof(destination))
{
    cache_get_value_name(row, field_name, destination, max_len);
}

stock cache_get_data(&rows, &fields)
{
	cache_get_row_count(rows);
	cache_get_field_count(fields);
}

stock cache_get_row_int(row, field_idx)
{
	new int_dest;
	cache_get_value_index_int(row, field_idx, int_dest);
	return int_dest;
}
stock Float:cache_get_field_float(row, const field_name[])
{
    new
        str[16];

    cache_get_field_content(row, field_name, str, sizeof(str));
    return floatstr(str);
}

stock SQL_ReturnEscaped(const string[])
{
    new entry[256];
    mysql_escape_string(string, entry, sizeof(entry));
    return entry;
}

stock cache_get_field_int(row, const field_name[])
{
    new val;
    cache_get_value_name_int(row, field_name, val);
    return val;
}

stock GiveDefaultWeapon(playerid)
{
    GivePlayerWeaponEx(playerid, WEAPON_DEAGLE, 50);
    GivePlayerWeaponEx(playerid, WEAPON_AK47, 100);
    GivePlayerWeaponEx(playerid, WEAPON_MP5, 100);
    return 1;
}

ConvertTimestamp(Timestamp:timestamp, bool:date = true)
{
    new output[256];

    if(date) TimeFormat(timestamp + Timestamp:UTC_07, "%a %d %b %Y, %T", output);
    else TimeFormat(timestamp + Timestamp:UTC_07, "%T", output);

    return output;
}


IsAnIP(str[])
{
    if(!str[0] || str[0] == '\1')
        return 0;

    for (new i = 0, l = strlen(str); i != l; i ++)
    {
        if((str[i] < '0' || str[i] > '9') && str[i] != '.')
            return 0;

        if(0 < ((i == 0) ? (strval(str)) : (strval(str[i + 1]))) > 255)
            return 0;
    }
    return 1;
}

ReturnIP(playerid)
{
    new ip[16];
    GetPlayerIp(playerid, ip, sizeof(ip));

    return ip;
}

LoadServerPickup()
{
    new count = 0;
    for(new i = 0; i<sizeof(RandomSpawn_PickupLS); i++)
    {
        Static_Pickup[i] = CreateDynamicPickup(RandomSpawn_PickupLS[i][random_Pickupmodel], 3, RandomSpawn_PickupLS[i][random_Pickupx], RandomSpawn_PickupLS[i][random_Pickupy], RandomSpawn_PickupLS[i][random_Pickupz]);
        Streamer_SetIntData(STREAMER_TYPE_PICKUP, Static_Pickup[i], E_STREAMER_EXTRA_ID, i);
        count++;
    }
    printf("Amount of Static Pickup : %d", count);
    return 1;
}

stock RemoveAlpha(color) {
    return (color & ~0xFF);
}

stock IsNumeric(const str[])
{
    for (new i = 0, l = strlen(str); i != l; i ++)
    {
        if(i == 0 && str[0] == '-')
            continue;

        else if(str[i] < '0' || str[i] > '9')
            return 0;
    }
    return 1;
}

IsValidNickName(const name[])
{
    for (new i = 0, l = strlen(name); i != l; i ++)
    {
        if(i == 0 && name[0] == '-')
            continue;

        else if(name[i] == '[' || name[i] == ']')
            return 1;
    }
    return 0;
}


TerminateConnection(playerid)
{
    SQL_SaveAccount(playerid);
    ResetStatistics(playerid);
    return 1;
}

GetVehicleModelByName(const name[])
{
    if(IsNumeric(name) && (strval(name) >= 400 && strval(name) <= 611))
        return strval(name);

    for (new i = 0; i < sizeof(g_arrVehicleNames); i ++)
    {
        if(strfind(g_arrVehicleNames[i], name, true) != -1)
        {
            return i + 400;
        }
    }
    return 0;
}

GetVehicleNameByModel(model)
{
    new
        name[32] = "None";

    if(model < 400 || model > 611)
        return name;

    format(name, sizeof(name), g_arrVehicleNames[model - 400]);
    return name;
}

FormatNumber(number, prefix[] = "$", delimiter[] = ",")
{
    static
        value[32],
        length;

    format(value, sizeof(value), "%d", (number < 0) ? (-number) : (number));

    if((length = strlen(value)) > 3)
    {
        for (new i = length, l = 0; --i >= 0; l ++) {
            if((l > 0) && (l % 3 == 0)) strins(value, delimiter, i + 1);
        }
    }
    if(prefix[0] != 0)
        strins(value, prefix, 0);

    if(number < 0)
        strins(value, "-", 0);

    return value;
}