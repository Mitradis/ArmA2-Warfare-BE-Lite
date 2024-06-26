Private ['_defaultTeamswitch','_displayEH_keydown','_logic','_mapEH_mousebttondown','_ppColor','_uav'];
_defaultTeamswitch = teamswitchenabled;

startLoadingScreen ["UAV","RscDisplayLoadMission"];

_uav = playerUAV;

//--- UAV destroyed
if (isnull _uav) exitwith {endLoadingScreen;hint format [localize "strwfbasestructuredestroyed",localize "str_uav_action"]};

//--- Switch view
gunner _uav removeweapon "nvgoggles";
_uav switchcamera "internal";
player remoteControl gunner _uav;
_uav lock true;
_uav selectweapon (weapons _uav select 0);
enableteamswitch false;
titletext ["","black in"];
BIS_UAV_TIME = 0;
BIS_UAV_PLANE = _uav;

//--- Disable HC
if (hcShownBar) then {hcshowbar false};

//--- Show MARTA icons
if (isnil "BIS_UAV_visible") then {BIS_UAV_visible = groupiconsvisible};
setGroupIconsVisible [true,true];
(group _uav) setvariable ["MARTA_waypoint",[true,[-1,-1,-1,-1]]];

//--- Prostprocess effects
//setaperture 24;
_ppColor = ppEffectCreate ["ColorCorrections", 1999];
_ppColor ppEffectEnable true;
_ppColor ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [1, 1, 1, 0.0], [0.2, 0.2, 0.2, 0]];
_ppColor ppEffectCommit 0;


//--- RSC
progressLoadingScreen 0.5;

//--- Detect pressed keys (temporary solution)
BIS_UAV_HELI_keydown = {
	Private ['_id','_key','_marker','_markertime','_newHeight','_uav','_worldpos'];
	_key = _this select 1;
	_uav = BIS_UAV_PLANE;

	//--- END
	if (_key in (actionkeys 'WalkRunTemp') && !visiblemap) then {bis_uav_terminate = true};

	//--- MARKER
	if (_key in (actionkeys 'Binocular') && !visiblemap) then {
		_id = 1;
		while {markertype format ['_user_defined_UAV_MARKER_%1',_id] != ''} do {
			_id = _id + 1;
		};
		_worldpos = screentoworld [0.5,0.5];
		_marker = createmarker [format ['_user_defined_UAV_MARKER_%1',_id],_worldpos];
		_marker setmarkertype 'mil_destroy';
		_marker setmarkercolor 'colorred';
		_marker setmarkersize [0.5,0.5];
		_markertime = [daytime] call bis_fnc_timetostring;
		_marker setmarkertext format ['UAV %1: %2',_id,_markertime];
	};

	//--- UP
	if (_key in (actionkeys 'HeliUp')) then {
		_newHeight = (position _uav select 2) + 50;
		if (_newHeight > 1000) then {_newHeight = 1000};
		if (speed _uav < 1) then {_uav domove position _uav;};
		_uav land 'none';
		_uav flyinheight _newHeight;
	};

	//--- DOWN
	if (_key in (actionkeys 'HeliDown')) then {
		_newHeight = (position _uav select 2) - 50;
		if (_newHeight < 100) then {_newHeight = 100};
		_uav land 'none';
		_uav flyinheight _newHeight;
	};
};
_displayEH_keydown = (finddisplay 46) displayaddeventhandler ["keydown","Private['_sqf']; _sqf = _this spawn BIS_UAV_HELI_keydown"];

//--- Change waypoints on map
_mapEH_mousebttondown = ((findDisplay 12) displayCtrl 51) ctrladdeventhandler ["mousebuttondown", "
	Private ['_button','_uav','_worldpos','_wp'];
	_button = _this select 1;
	if (_button == 0) then {
		_uav = BIS_UAV_PLANE;

		while {count (waypoints _uav) > 0} do {deletewaypoint ((waypoints _uav) select 0)};

		_worldpos = (_this select 0) posscreentoworld [_this select 2,_this select 3];
		_wp = (group _uav) addwaypoint [_worldpos,0];
		_wp setWaypointType 'MOVE';
		(group _uav) setcurrentwaypoint _wp;
	};
"];

//////////////////////////////////////////////////
endLoadingScreen;
//////////////////////////////////////////////////


//--- TERMINATE
waituntil {sleep 0.05;!isnil "bis_uav_terminate" || !alive _uav || !alive player};
if (!alive _uav) then {
	hint format [localize "strwfbasestructuredestroyed",localize "str_uav_action"];
};
titletext ["","black in"];
(finddisplay 46) displayremoveeventhandler ["keydown",_displayEH_keydown];
((findDisplay 12) displayCtrl 51) ctrlremoveeventhandler ["mousebuttondown",_mapEH_mousebttondown];
bis_uav_terminate = nil;
BIS_UAV_TIME = nil;
BIS_UAV_PLANE = nil;
objnull remoteControl gunner _uav;
player switchcamera "internal";
enableteamswitch _defaultTeamswitch;

setGroupIconsVisible BIS_UAV_visible;
BIS_UAV_visible = nil;
(group _uav) setvariable ["MARTA_waypoint",[false,[-1,-1,-1,-1]]];

ppEffectDestroy _ppColor;

//1124 cuttext ["","plain"];
