Private ["_destination","_formations","_mission","_radius","_team","_update"];
_team = _this select 0;
_destination = _this select 1;
_mission = _this select 2;
_radius = if (count _this > 3) then {_this select 3} else {30};

_update = true;
if (side _team == west || side _team == east) then {
	_update = (_team) Call CanUpdateTeam;
};

//--- Override.
if (_update) then {_team Call UpdateTeam};



[_team,true,[[_destination, _mission, _radius, 20, "", []]]] Call AIWPAdd;