Private ["_closest","_near","_pos","_range"];_closest = objNull;_pos = _this select 0;_range = _this select 1;_near = _pos nearEntities [WFBE_Logic_Airfield, _range];{if !(isNil {_x getVariable "wfbe_hangar"}) then {if (alive (_x getVariable "wfbe_hangar")) then {_closest = _x}}} forEach _near;_closest