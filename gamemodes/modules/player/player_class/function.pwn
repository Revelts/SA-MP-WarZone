GetPlayerClass(playerid)
{
	return PlayerClass[playerid][pClass];
}

SetPlayerClass(playerid, class)
{
	PlayerClass[playerid][pClass] = class;
	return 1;
}

GetClassName(class)
{
	new name[255];
	switch(class)
	{
		case CLASS_SCOUT: name = "Scout Master"; 
		case CLASS_SUPPORT: name = "Support"; 
		case CLASS_ASSAULT: name = "Assault Master";
		case CLASS_SPECIALIST: name = "Specialist";
		default : name = "None"; 	
	}
	return name;	
}

GetPlayerClassName(playerid)
{
	new 
		name[255], 
		class = GetPlayerClass(playerid)
	;

	switch(class)
	{
		case CLASS_SCOUT: name = "Scout Master"; 
		case CLASS_SUPPORT: name = "Support Unit"; 
		case CLASS_ASSAULT: name = "Assault Master";
		case CLASS_SPECIALIST: name = "Specialist";
		default : name = "None"; 	
	}
	return name;
}

ShowClassList(playerid)
{
	new string[1024];
	for(new i = 0; i < MAX_CLASS; i++)
	{
		strcat(string, sprintf("%s\n", GetClassName(i+1)));
	}
	Dialog_Show(playerid, CLASS_MENU, DIALOG_STYLE_LIST, "Class List", string, "Choose", "Close");
	return 1;
}

InsertPlayerClass(playerid)
{
	new query[1024];
	format(query, sizeof(query), "INSERT INTO `player_class` (`pID`, `pClass`, `pClassLevel`, `pClassExp`) VALUES ('%d', '%d', '%d', '%.2f');", 
	PlayerData[playerid][pID], 
	PlayerClass[playerid][pClass],
	PlayerClass[playerid][pClassLevel],
	PlayerClass[playerid][pClassExp]
	);
	mysql_tquery(g_iHandle, query);
	return 1;
}

SQL_LoadClass(playerid)
{
    new query[522];
    format(query, sizeof(query), "SELECT * FROM `player_class` WHERE `pID` = '%d' LIMIT 1;", PlayerData[playerid][pID]);
    mysql_tquery(g_iHandle, query, "LoadPlayerClass", "d", playerid);
    return 1;
}

UpdatePlayerClass(playerid)
{
	new query[1024];
	format(query, sizeof(query), "UPDATE `player_class` SET `pClass` = '%d' , `pClassLevel` = '%d', `pClassEXP` = '%.2f' WHERE `pID` = '%d'",  
	PlayerClass[playerid][pClass],
	PlayerClass[playerid][pClassLevel],
	PlayerClass[playerid][pClassExp],
	PlayerData[playerid][pID]
	);
	mysql_tquery(g_iHandle, query);
	return 1;
}

DeletePlayerClass(playerid)
{
	new query[1024];
	format(query, sizeof(query), "DELETE FROM `player_class` WHERE `pID` = '%d'", PlayerData[playerid][pID]);
	mysql_tquery(g_iHandle, query);
	SetPlayerClass(playerid, CLASS_NONE);
	return 1;
}

forward LoadPlayerClass(playerid);
public LoadPlayerClass(playerid)
{
    if(cache_num_rows()) 
    {
        PlayerClass[playerid][pClass] = cache_get_field_int(0, "pClass");
        PlayerClass[playerid][pClassLevel] = cache_get_field_int(0, "pClassLevel");
        PlayerClass[playerid][pClassExp] = cache_get_field_float(0, "pClassExp");
	}
	return 1;
}