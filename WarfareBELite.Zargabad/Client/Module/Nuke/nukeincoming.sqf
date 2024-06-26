//--- Nuke launching.
Private ['_cruise','_dropPosition','_dropPosX','_dropPosY','_dropPosZ','_misFlare','_nukeMarker','_path','_pathS','_planespawnpos','_target','_type'];
_target = _this select 0;
_nukeMarker = _this select 1;

// WFBE_LocalizeMessage = [nil,'CLTFNCLOCALIZEMESSAGE',['TacticalLaunch']];
// publicVariable 'WFBE_LocalizeMessage';
// if (isHostedServer || local player) then {[nil,'CLTFNCLOCALIZEMESSAGE',['TacticalLaunch']] Spawn HandlePVF};
[nil, "LocalizeMessage", ['TacticalLaunch']] Call SendToClients;
(localize "STR_WF_CHAT_ICBM_Launch") Call CommandChatMessage;

sleep 300;

_path = "\ca\air2\cruisemissile\"; //";
_pathS = _path + "data\scripts\"; //";

_dropPosition = getpos _target;
_type = if (WF_A2_Vanilla) then {'Chukar'} else {'Chukar_EP1'};
_cruise = createVehicle [_type,_dropPosition,[], 0, "FLY"];
_cruise setVectorDir [ 0.1,- 1,+ 0.5];
_cruise setPos [(getPos _cruise select 0),(getPos _cruise select 1),570];
_cruise setVelocity [0,2,0];
_cruise flyInHeight 570;
_cruise setSpeedMode "FULL";

["RequestSpecial", ["ICBM",sideJoined,_target,_cruise,clientTeam]] Call SendToServer;

sleep 1.5;

[nil, "DisplayICBM", [_target,_cruise]] Call SendToClients;

_misFlare = objNull;
if (WF_A2_Vanilla) then {
	_dropPosX = _dropPosition select 0;
	_dropPosY = _dropPosition select 1;
	_dropPosZ = _dropPosition select 2;

	_planespawnpos = [_dropPosX , _dropPosY , _dropPosZ + 600];

	_misFlare = createVehicle ["cruiseMissileFlare1",_planespawnpos,[], 0, "NONE"];
	_misFlare inflame true;
	_cruise setVariable ["cruisemissile_level", false];
	[_cruise, _misFlare] execVM (_pathS + "cruisemissileflare.sqf");
	_cruise setObjectTexture [0, _path + "data\exhaust_flame_ca"];
	[_cruise] execVM (_pathS + "exhaust1.sqf");
};

sleep 7;

waitUntil {sleep 0.05;!alive _cruise};

sleep 5;
if (WF_A2_Vanilla) then {deleteVehicle _misFlare};
deleteVehicle _cruise;

sleep 50;
deleteMarkerLocal _nukeMarker;
