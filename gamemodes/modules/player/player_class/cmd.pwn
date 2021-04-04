CMD:takeclass(playerid, params[])
{
    if(GetPlayerLevel(playerid) >= 10 && GetPlayerClass(playerid) == CLASS_NONE)
    {
        ShowClassList(playerid);
    }
    else SendErrorMessage(playerid, "Kamu harus mencapai level 10 terlebih dahulu untuk mengambil class!");
    return 1;
}

CMD:leaveclass(playerid, params[])
{
    if(GetPlayerClass(playerid) == CLASS_NONE)
        return SendErrorMessage(playerid, "Kamu tidak memiliki class apapun!");

    SendServerMessage(playerid, "Kamu telah keluar dari class %s", GetPlayerClassName(playerid));
    DeletePlayerClass(playerid);
    return 1;    
}