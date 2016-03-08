// Author: Demellion (Dismal Team) for Epoch Mod
if !(hasInterface) then {
    "ASH" addPublicVariableEventHandler {_this select 1 call fn_access_block};
fn_access_block = {
	argument = _this select 0;
	hack_uid = _this select 1;
	hack_name = _this select 2;
	hack_pos = _this select 3;
	publicVariable "hack_uid";
	publicVariable "hack_name";
	
    if (argument == 0) then {
		 {[format["%1 (%2) BANNED, REASON - [SAFE/LOCKBOX HACK]",hack_uid,hack_name],0,0.7,10,2] spawn bis_fnc_dynamictext} remoteExecCall ["bis_fnc_call", 0]; 
		_this = format ['%4 |ASH| - %2 (%1) VIOLATED vault at %3 (FPS: %5, TICK: %6)',hack_uid,hack_name,hack_pos,time,diag_fps,diag_tickTime];
		"ARMA_LOG" callExtension format ["ASH_LOG:%1",_this];
		"ARMA_BAN" callExtension format[':%1 \\SafeHack (%2)',hack_uid,hack_name];
		diag_log format ["ASH: %1",_this];	
	};
	if (argument == 1) then {
		{[format["%1 (%2) KICKED, REASON - [SAFE/LOCKBOX HACK]",hack_uid,hack_name],0,0.7,10,2] spawn bis_fnc_dynamictext} remoteExecCall ["bis_fnc_call", 0];
		_this = format ['%4 |ASH| - %2 (%1) VIOLATED vault at %3 (FPS: %5, TICK: %6)',hack_uid,hack_name,hack_pos,time,diag_fps,diag_tickTime];
		"ARMA_LOG" callExtension format ["ASH_LOG:%1",_this];
		diag_log format ["ASH: %1",_this];	
	};		
	if (argument == 2) then {
		_this = format ['%4 |ASH| - %2 (%1) ACCESSED vault nearby locked one at %3 (FPS: %5, TICK: %6)',hack_uid,hack_name,hack_pos,time,diag_fps,diag_tickTime];
		"ARMA_LOG" callExtension format ["ASH_LOG:%1",_this];
		diag_log format ["ASH: %1",_this];
	};	
  };
};
