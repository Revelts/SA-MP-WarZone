#define MAX_CLAN 100
#define INVALID_CLAN_ID -1


enum E_PLAYER_CLAN
{
    clanID,
    clanName[128],
    clanTag[10],
    clanColor
};

new ClanData[MAX_CLAN][E_PLAYER_CLAN],
    Iterator:Clan<MAX_CLAN>;


enum
{
    CLAN_RANK_NONE = 0,
    CLAN_RANK_MEMBER,
    CLAN_RANK_VICE,
    CLAN_RANK_LEADER
}