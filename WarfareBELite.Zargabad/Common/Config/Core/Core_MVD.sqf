/* MVD Configuration */
Private ['_c','_get','_i','_p','_z'];

_c = [];
_i = [];

/* Infantry */
_c = _c + ['MVD_Soldier_GL'];
_i = _i + [['','',310,7,-1,3,0,0.98,'East',[]]];

_c = _c + ['MVD_Soldier_MG'];
_i = _i + [['','',320,7,-1,3,0,0.98,'East',[]]];

_c = _c + ['MVD_Soldier_Marksman'];
_i = _i + [['','',330,7,-1,3,0,0.99,'East',[]]];

_c = _c + ['MVD_Soldier_AT'];
_i = _i + [['','',345,7,-1,3,0,0.99,'East',[]]];

_c = _c + ['MVD_Soldier_Sniper'];
_i = _i + [['','',350,7,-1,3,0,0.99,'East',[]]];

_c = _c + ['MVD_Soldier_TL'];
_i = _i + [['','',360,7,-1,3,0,1.0,'East',[]]];

for '_z' from 0 to (count _c)-1 do {
	if (isClass (configFile >> 'CfgVehicles' >> (_c select _z))) then {
		_get = (_c select _z) Call GetNamespace;
		if (isNil '_get') then {
			if ((_i select _z) select 0 == '') then {(_i select _z) set [0, [_c select _z,'displayName'] Call GetConfigInfo]};
			if (typeName ((_i select _z) select 4) == 'SCALAR') then {
				if (((_i select _z) select 4) == -2) then {
					_ret = (_c select _z) Call Compile preprocessFile "Common\Functions\Common_GetConfigVehicleCrewSlot.sqf";
					(_i select _z) set [4, _ret select 0];
					(_i select _z) set [9, _ret select 1];
				};
			};
			_p = if ((_c select _z) isKindOf 'Man') then {'portrait'} else {'picture'};
			(_i select _z) set [1, [_c select _z,_p] Call GetConfigInfo];
			[_c select _z,_i select _z] Call SetNamespace;
		};
	};
};
