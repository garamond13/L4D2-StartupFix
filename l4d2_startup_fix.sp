#include <sourcemod>

#pragma semicolon 1
#pragma newdecls required

#define VERSION "1.1.0"

#define MAX_MAP_NAME 32

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
		char buffer[MAX_MAP_NAME + 4];
		GetCurrentMap(buffer, sizeof(buffer));
		PrintToServer("L4D2 StartupFix: Reloading map!");
		Format(buffer, sizeof(buffer), "map %s", buffer);
		ServerCommand(buffer);
		execute = false;
	}
}