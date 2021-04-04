
Dialog:ShowOnly(playerid, response, listitem, inputtext[]) {
    playerid = INVALID_PLAYER_ID;
    response = 0;
    listitem = 0;
    inputtext[0] = '\0';
}
Dialog:UPGRADE_MENU(playerid, response, listitem, inputtext[])
{
    if(response)
    {
        if(GetPlayerMoneyEx(playerid) < 500)
            return SendErrorMessage(playerid, "Kamu tidak mempunyai cukup uang untuk upgrade ini !");

        switch(listitem)
        {
            case 0: 
            {
                SetPlayerMaxHealth(playerid, 1.0);
                GivePlayerMoneyEx(playerid, -500);
                cmd_upgrade(playerid, "");
            }
            case 1: 
            {
                SetPlayerMaxArmour(playerid, 1.0);
                GivePlayerMoneyEx(playerid, -500);
                cmd_upgrade(playerid, "");
            }
        }
    }
    return 1;
}
Dialog:DIALOG_HELP(playerid, response, listitem, inputtext[])
{
    if(response)
    {
        switch(listitem)
        {
            case 0:
            {
                SendCustomMessage(playerid, "[-] General:","'"YELLOW"/setteam"WHITE"' Untuk set team kamu dengan team kamu.");
                SendCustomMessage(playerid, "[-] General:","'"YELLOW"/pm"WHITE"' chat private orang lain.");
                SendCustomMessage(playerid, "[-] General:","'"YELLOW"/upgrade"WHITE"' upgrade point karakter kamu!.");
                SendCustomMessage(playerid, "[-] General:","'"YELLOW"/cmc"WHITE"' menghapus chat di chatbox!.");
                SendCustomMessage(playerid, "[-] General:","'"YELLOW"!"WHITE"' Gunakan ketika chat untuk Team-Chat.");
            }
            case 1:
            {
                SendCustomMessage(playerid, "[-] Vehicle:","Player Hanya bisa spawn 1 kendaraan, gunakan modelid atau model name untuk spawn!.");
                SendCustomMessage(playerid, "[-] Vehicle:","Uang player akan di pakai ketika spawn kendaraan menggunakan /veh!.");
                SendCustomMessage(playerid, "[-] Vehicle:","'"YELLOW"/veh"WHITE"' Untuk spawn kendaraan.");
            }
            case 2:
            {
                SendCustomMessage(playerid, "[-] Clan:","'"YELLOW"/createclan"WHITE"' Membuat clan.");
                SendCustomMessage(playerid, "[-] Clan:","Contoh /createclan FromZeroToHero FzTH");
                SendCustomMessage(playerid, "[-] Clan:","'"YELLOW"/disbandclan"WHITE"' membubarkan clan.");
                SendCustomMessage(playerid, "[-] Clan:","'"YELLOW"/leaveclan"WHITE"' keluar dari clan clan.");
                SendCustomMessage(playerid, "[-] Clan:","'"YELLOW"/clancolor"WHITE"' mengganti warna clan Hex color cek google.");
                SendCustomMessage(playerid, "[-] Clan:","'"YELLOW"/setrank"WHITE"' mengganti rank clan seseorang clan.");
                SendCustomMessage(playerid, "[-] Clan:","'"YELLOW"#"WHITE"' Gunakan ketika chat untuk clan chat.");
            }
        }
    }
    return 1;
}