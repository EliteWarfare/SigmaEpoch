[] execVM "blckClient.sqf";
[] execVM "IgiLoad\IgiLoadInit.sqf";
[] execVM "addons\Status_Bar\init_statusBar.sqf";
[] execVM "addons\messages\init.sqf";
[] execVM "addons\halv_spawn\init.sqf";
[] execVM "addons\taru\init.sqf";
[] execVM "HC\Init.sqf"; 
[] execVM "compile\fn_ASHclient.sqf";
[] execVM "outlw_magRepack\MagRepack_init_sv.sqf";
[] execVM "addons\paintshop\paintshop.sqf";
// Welcome Credits by Gr8
[] execVM "custom\welcome.sqf";

//////////////////////////////////////////////////////////////////////////
//cmEARPLUGS CODE START

call compile preProcessFileLineNumbers "cmEarplugs\config.sqf";

//cmEARPLUGS CODE END
//////////////////////////////////////////////////////////////////////////


//Supply Drop Alert Event
"SDROP_Alert" addPublicVariableEventHandler {
	hint parseText format["%1", _this select 1];
};
//Attach Explosives
if (!isDedicated and hasInterface) then 
{
	while {true} do
	{
		waitUntil {alive vehicle player};
		Sleep 30;
		[] execVM "addons\EtV\EtV.sqf";
		waitUntil {!isNil "EtVInitialized"};
		[player] call EtV_Actions;
				
		waitUntil {!alive player};
		Sleep 30;
		[] execVM "addons\EtV\EtV.sqf";
		waitUntil {!isNil "EtVInitialized"};
		[player] call EtV_Actions;	
		
		
	};
};


//----SEM----
if(hasInterface)then{execVM "semClient.sqf";};
//---SEM---

//----Blck----
if (isServer) then {
	execVM "\q\addons\custom_server\init.sqf";
};
//---Blck---




/*This has to be added to the clients init*/
if(isDedicated)exitWith{};

fn_createMissionMarker ={	private["_create","_markerPos","_markerName","_marker"];
	//_this = _this select 1;
	_create = _this select 0;
	
	if(!_create)then[{	//delete marker
		if !(getMarkerColor "MissionMarker" == "")then{	//Only delete existing Marker
			deleteMarkerLocal "MissionMarker";
		}; 
	},{	//else create marker
	_markerPos = _this select 1;
	_markerName = _this select 2;
	
	_marker = createMarkerLocal ["MissionMarker", _markerPos];
	_marker setMarkerPosLocal _markerPos;
	_marker setMarkerTypeLocal "mil_destroy";  
	_marker setMarkerTextLocal format["%1",_markerName];  
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerDirLocal -30;
	_marker setMarkerSizeLocal [1.5,1.5];
	}];
};

if(!isNil "GlobalMissionMarker")then{GlobalMissionMarker call fn_createMissionMarker};
"GlobalMissionMarker" addPublicVariableEventHandler {_this select 1 call fn_createMissionMarker};
"GlobalHint" addPublicVariableEventHandler {hint parseText format["%1", _this select 1]};

//[]spawn{while{alive player}do{player allowDamage true;vehicle player allowDamage true;}};

#include "A3EAI_Client\A3EAI_initclient.sqf";