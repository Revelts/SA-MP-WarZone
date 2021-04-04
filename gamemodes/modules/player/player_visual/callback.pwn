#include <YSI\y_hooks>

hook OnPlayerConnect(playerid)
{
    DrawPlayerStats(playerid);
    DrawPlayerFooter(playerid);
    return 1;
}