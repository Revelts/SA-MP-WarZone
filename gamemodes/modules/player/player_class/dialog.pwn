
Dialog:CLASS_MENU(playerid, response, listitem, inputtext[])
{
    if(response)
    {
        switch(listitem)
        {
            case 0: SetPlayerClass(playerid, CLASS_SCOUT), SendServerMessage(playerid, "Kamu telah memilih untuk menjadi scout master!");
            case 1: SetPlayerClass(playerid, CLASS_SUPPORT), SendServerMessage(playerid, "Kamu telah memilih untuk menjadi support unit!");
            case 2: SetPlayerClass(playerid, CLASS_ASSAULT), SendServerMessage(playerid, "Kamu telah memilih untuk menjadi assault master!");
            case 3: SetPlayerClass(playerid, CLASS_SPECIALIST), SendServerMessage(playerid, "Kamu telah memilih untuk menjadi specialist unit!");
        }
        InsertPlayerClass(playerid);
    }
    return 1;
}