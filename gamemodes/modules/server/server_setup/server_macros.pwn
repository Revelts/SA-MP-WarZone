/*==============================================================================
    Server Macros
==============================================================================*/
#define SendServerMessage(%0,%1)        SendClientMessageEx(%0, COLOR_ORANGE, "SERVER [-]: "WHITE""%1)
#define SendCustomMessage(%0,%1,%2)     SendClientMessageEx(%0, X11_LIGHT_SKY_BLUE_1, %1": "WHITE""%2)
#define SendSyntaxMessage(%0,%1)        SendClientMessageEx(%0, COLOR_LIGHTGREEN, "CMD [~]: "WHITE""%1)
#define SendErrorMessage(%0,%1)         SendClientMessageEx(%0, COLOR_YELLOW, "ERROR [!]: "WHITE""%1)
