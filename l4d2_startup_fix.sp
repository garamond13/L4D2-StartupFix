#include <sourcemod>

#pragma semicolon 1
#pragma newdecls required

#define VERSION "1.0.0"

// Max length of a game pathname.
#define MAX_QPATH 96

public Plugin myinfo = {
	name = "L4D2 StartupFix",
	author = "Garamond",
	description = "Reloads map on server startup, fixes various issues",
	version = VERSION,
	url = "https://github.com/garamond13/L4D2-StartupFix"
};

public void OnMapStart()
{
	static bool execute = true;
	if (execute) {
		char buffer[MAX_QPATH + 4];
		GetCurrentMap(buffer, sizeof(buffer));
		PrintToServer("L4D2 StartupFix: Reloading map!");
		Format(buffer, sizeof(buffer), "map %s", buffer);
		ServerCommand(buffer);
		execute = false;
	}
}