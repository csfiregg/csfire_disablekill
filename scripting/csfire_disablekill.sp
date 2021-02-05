#include <sourcemod>

#pragma newdecls required
#pragma semicolon 1

#define TAG_NCLR "[CSFIRE]"
#define TAG_CLR "[\x10csfire.gg\x01]"

public Plugin myinfo =
{
	name = "csfire_disablekill",
	author = "DRANIX",
	description = "Disable console kill commands (sm_explode, sm_kill)",
	version = "1.0",
	url = "www.csfire.gg"
};

public void OnPluginStart()
{
	AddCommandListener(Command_kill, "kill");
	AddCommandListener(Command_kill, "explode");
}

public Action Command_kill(int client, const char[] command, int argc)
{
	PrintToChat(client, "%s \x08You are not allowed to \x0Fkill \x08yourself.", TAG_CLR);
	return Plugin_Handled;
}