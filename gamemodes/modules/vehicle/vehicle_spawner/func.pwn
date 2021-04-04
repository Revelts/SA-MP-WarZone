Vehicle_Create(playerid, modelid, Float:x, Float:y, Float:z, Float:rotation)
{
	PlayerData[playerid][pVehicle] = CreateVehicle(modelid, Float:x, Float:y, Float:z, Float:rotation, -1, -1, -1, 0);
	return 1;
}

SetEngineStatus(vehicleid, status)
{
    static engine, lights, alarm, doors, bonnet, boot, objective;
    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
    return SetVehicleParamsEx(vehicleid, status, lights, alarm, doors, bonnet, boot, objective);
}