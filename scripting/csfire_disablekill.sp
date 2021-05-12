#include <sourcemod>
#include <sourcecolors>

#define TAG_NCLR "[csfire.gg]"
#define TAG_CLR "[\x10csfire.gg\x01]"

#pragma newdecls required
#pragma semicolon 1

ConVar g_cvEnableDisableKill;

public Plugin myinfo =
{
	name = "csfire_disablekill",
	author = "DRANIX",
	description = "Disable console kill commands (sm_explode, sm_kill)",
	version = "1.3",
	url = "https://csfire.gg/discord"
};

public void OnPluginStart() {

	LoadTranslations("csfire_disablekill.phrases");

	AddCommandListener(Command_kill, "kill");
	AddCommandListener(Command_kill, "explode");

	g_cvEnableDisableKill = CreateConVar("sm_disablekill", "0", "Enable or disabled kill console commands", FCVAR_PROTECTED, true, 0.0, true, 1.0);

}

public Action Command_kill(int client, const char[] command, int argc) {

	if(g_cvEnableDisableKill.BoolValue)
    {
		CPrintToChat(client, "%s %t", TAG_CLR, "Suicide_NotAllowed");
		ReplyToCommand(client, "%s %t", TAG_NCLR, "Suicide_NotAllowed_Console");
		return Plugin_Handled;
    }

	return Plugin_Continue;
}
