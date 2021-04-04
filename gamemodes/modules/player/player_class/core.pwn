#define    MAX_CLASS            4

#define    CLASS_NONE           0
#define    CLASS_SCOUT          1
#define    CLASS_SUPPORT        2
#define    CLASS_ASSAULT        3
#define    CLASS_SPECIALIST     4

enum E_PLAYER_CLASS
{
    pID,
    pClass,
    pClassLevel,
    Float:pClassExp
};

new PlayerClass[MAX_PLAYERS][E_PLAYER_CLASS];


