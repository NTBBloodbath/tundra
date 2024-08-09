{ config, lib, pkgs, ... }:

{
	# Steam
	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true;
		gamescopeSession.enable = true;
		# extraCompatPackages = [ pkgs.proton-ge-bin.steamcompattool ];
	};
	hardware.steam-hardware.enable = true;

	environment.sessionVariables.STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
	programs.gamemode.enable = true;
}
