waitUntil {!isNuLL(uiNameSpace getVariable ["EPOCH_loadingScreen",displayNull])};
waitUntil {isNuLL(uiNameSpace getVariable ["EPOCH_loadingScreen",displayNull])};
waitUntil {!isNull player};
waitUntil {!(isNull (findDisplay 46))};

//Status Bar Config and Startup Options

//Choose Options
//--------------------------------------------------------------------------------------------------------------------------------------		
_WSC = false;  //Option whether to use and display world space coords in the admin status bar (true or false)


_sb_admin_list = ["76561198074208389","76561198066575039","76561197976011764","76561198021745490","76561198110957956"];	
//--------------------------------------------------------------------------------------------------------------------------------------

//Start the Status Bar
	
if ((getPlayerUID player) in _sb_admin_list) then  //admins id here
{ 
	if (_WSC) then
	{
		[] execVM "addons\status_bar\adminbar_ws.sqf";
	}
	else
	{
		[] execVM "addons\status_bar\adminbar.sqf";
	};
} 
else 
{
	[] execVM "addons\status_bar\PlayerBar.sqf";
};