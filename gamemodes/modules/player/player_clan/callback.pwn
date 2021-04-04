#include <YSI\y_hooks>

hook OnGameModeInitEx()
{
    mysql_pquery(g_iHandle, "SELECT * FROM `player_clan` ORDER BY `clanID` ASC LIMIT "#MAX_CLAN";", "OnClanLoaded", "");
}