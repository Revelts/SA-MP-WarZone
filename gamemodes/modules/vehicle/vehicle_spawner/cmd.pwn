CMD:veh(playerid, params[])
{
    new model[32], Float:x, Float:y, Float:z, Float:angle;

	if(sscanf(params, "s[32]", model))
		return SendSyntaxMessage(playerid, "/veh [model id/name]");

	if((model[0] = GetVehicleModelByName(model)) == 0)
		return SendErrorMessage(playerid, "Model ID kendaraan tidak valid!");

    if(GetPlayerMoneyEx(playerid) < 500)
        return SendErrorMessage(playerid, "Kamu tidak mempunyai $500 untuk spawn kendaraan!");

    if(model[0] == 432 || model[0] == 425 || model[0] == 520 || model[0] == 447)
        return SendErrorMessage(playerid, "Tidak bisa spawn kendaraan ini! cari kendaraan tersebut di san andreas!");

    if(IsValidVehicle(PlayerData[playerid][pVehicle]))
        DestroyVehicle(PlayerData[playerid][pVehicle]);

    GivePlayerMoneyEx(playerid, -500);

    GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, angle);

    Vehicle_Create(playerid, model[0], x, y, z, angle);
    SetEngineStatus(PlayerData[playerid][pVehicle], true);
    PutPlayerInVehicle(playerid, PlayerData[playerid][pVehicle], 0);
    SendServerMessage(playerid, "Kemu mengeluarkan kendaraan %s seharga $500, kendaraan akan otomatis hilang jika spawn kendaraan lain!", GetVehicleNameByModel(model[0]));
    return 1;
}