Private ["_side"];

_side = "GUER";

//--- Generic.
missionNamespace setVariable [Format["WFBE_%1CREW", _side], 'TK_GUE_Soldier_EP1'];
missionNamespace setVariable [Format["WFBE_%1PILOT", _side], 'TK_GUE_Soldier_EP1'];
missionNamespace setVariable [Format["WFBE_%1SOLDIER", _side], 'TK_GUE_Soldier_EP1'];

//--- Flag texture.
missionNamespace setVariable [Format["WFBE_%1FLAG", _side], '\ca\ca_e\data\flag_tkg_co.paa'];

missionNamespace setVariable [Format["WFBE_%1AMBULANCES", _side], ['V3S_TK_GUE_EP1']];
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCKS", _side], ['V3S_Repair_TK_GUE_EP1']];
missionNamespace setVariable [Format["WFBE_%1SALVAGETRUCK", _side], ['V3S_Salvage_TK_GUE_EP1']];
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCKS", _side], ['V3S_Supply_TK_GUE_EP1']];

//--- Radio Announcers.
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers", _side], ['WFHQ_TK0_EP1','WFHQ_TK1_EP1','WFHQ_TK2_EP1','WFHQ_TK3_EP1','WFHQ_TK4_EP1']];
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers_Config", _side], 'RadioProtocol_EP1_TK'];

//--- Server only.
if (isServer) then {
	//--- Patrols.
	missionNamespace setVariable [Format["WFBE_%1_PATROL_LIGHT", _side], [
		['TK_GUE_Soldier_EP1','TK_GUE_Soldier_MG_EP1','TK_GUE_Soldier_Sniper_EP1','TK_GUE_Bonesetter_EP1'], 
		['TK_GUE_Warlord_EP1','TK_GUE_Soldier_AR_EP1','TK_GUE_Soldier_3_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_4_EP1'],
		['Offroad_DSHKM_TK_GUE_EP1','Offroad_SPG9_TK_GUE_EP1']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_MEDIUM", _side], [
		['BTR40_MG_TK_GUE_EP1','Ural_ZU23_TK_GUE_EP1'], 
		['V3S_TK_GUE_EP1','TK_GUE_Warlord_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_MG_EP1','TK_GUE_Soldier_HAT_EP1'],
		['BTR40_MG_TK_GUE_EP1','TK_GUE_Soldier_AA_EP1','TK_GUE_Soldier_AA_EP1','TK_GUE_Bonesetter_EP1']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_HEAVY", _side], [
		['T34_TK_GUE_EP1','T34_TK_GUE_EP1'], 
		['T55_TK_GUE_EP1','T55_TK_GUE_EP1'],
		['TK_GUE_Soldier_Sniper_EP1','TK_GUE_Soldier_5_EP1','TK_GUE_Soldier_Sniper_EP1']
	]];
	
	//--- Base Patrols.
	if (paramBasePatrols) then {
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_0", _side],['TK_GUE_Warlord_EP1','TK_GUE_Soldier_EP1','TK_GUE_Soldier_4_EP1','TK_GUE_Soldier_AR_EP1','TK_GUE_Soldier_4_EP1','TK_GUE_Soldier_MG_EP1']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_1", _side],['TK_GUE_Warlord_EP1','TK_GUE_Soldier_2_EP1','TK_GUE_Soldier_EP1','TK_GUE_Soldier_MG_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Bonesetter_EP1']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_2", _side],['TK_GUE_Warlord_EP1','TK_GUE_Soldier_EP1','TK_GUE_Soldier_3_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_AA_EP1','TK_GUE_Soldier_Sniper_EP1']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_3", _side],['TK_GUE_Warlord_EP1','TK_GUE_Soldier_EP1','TK_GUE_Soldier_AR_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_5_EP1']];
	};
	
	//--- Paratroopers.
	missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL1", _side],['TK_GUE_Warlord_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_AR_EP1','TK_GUE_Bonesetter_EP1']];
	missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL2", _side],['TK_GUE_Warlord_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_AA_EP1','TK_GUE_Soldier_MG_EP1','TK_GUE_Bonesetter_EP1','TK_GUE_Soldier_Sniper_EP1','TK_GUE_Soldier_Sniper_EP1']];
	missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL3", _side],['TK_GUE_Warlord_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_AA_EP1','TK_GUE_Soldier_AA_EP1','TK_GUE_Soldier_4_EP1','TK_GUE_Soldier_5_EP1','TK_GUE_Soldier_Sniper_EP1','TK_GUE_Soldier_Sniper_EP1']];
	
	missionNamespace setVariable [Format["WFBE_%1PARACARGO", _side], 'UH1H_TK_GUE_EP1'];//--- Paratroopers, Vehicle.
	missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCK", _side], 'V3S_Repair_TK_GUE_EP1'];//--- Repair Truck model.
	missionNamespace setVariable [Format["WFBE_%1STARTINGVEHICLES", _side], ['V3S_TK_GUE_EP1']];//--- Starting Vehicles.
	missionNamespace setVariable [Format["WFBE_%1PARAAMMO", _side], ['TKBasicAmmunitionBox_EP1','TKBasicWeapons_EP1','TKLaunchers_EP1']];//--- Supply Paradropping, Dropped Ammunition.
	missionNamespace setVariable [Format["WFBE_%1PARAVEHICARGO", _side], 'BTR40_TK_GUE_EP1'];//--- Supply Paradropping, Dropped Vehicle.
	missionNamespace setVariable [Format["WFBE_%1PARAVEHI", _side], 'UH1H_TK_GUE_EP1'];//--- Supply Paradropping, Vehicle
	missionNamespace setVariable [Format["WFBE_%1PARACHUTE", _side], 'ParachuteMediumEast_EP1'];//--- Supply Paradropping, Parachute Model.
	missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCK", _side], 'V3S_Supply_TK_GUE_EP1'];//--- Supply Truck model.
	
	//--- AI Loadouts [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_0", _side], [
		[['AKS_74_kobra','RPG18','Makarov','Binocular','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','RPG18','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AKS_74_kobra','RPG18','Makarov']],
		[['AKS_74_U','RPG18','Makarov','Binocular','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','RPG18','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AKS_74_U','RPG18','Makarov']]
	]];	
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_1", _side], [
		[['AKS_74_kobra','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7V','PG7V','PG7V','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AKS_74_kobra','RPG7V','Makarov']],
		[['AKS_74_kobra','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7V','PG7V','PG7V','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AKS_74_kobra','RPG7V','Makarov']],
		[['SVD','MakarovSD','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','HandGrenade_East','HandGrenade_East','8Rnd_9x18_MakarovSD','8Rnd_9x18_MakarovSD','8Rnd_9x18_MakarovSD','8Rnd_9x18_MakarovSD'],
		 ['SVD','MakarovSD']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_2", _side], [
		[['AKS_74_pso','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7VL','PG7VL','PG7VL','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AKS_74_pso','RPG7V','Makarov']],
		[['AKS_74_pso','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7VL','PG7VL','PG7VL','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AKS_74_pso','RPG7V','Makarov']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_3", _side], [
		[['AK_74_GL_kobra','RPG7V','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7VR','PG7VR','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25'],
		 ['AK_74_GL_kobra','RPG7V']],
		[['AK_74_GL_kobra','MetisLauncher','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','AT13','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25'],
		 ['AK_74_GL_kobra','MetisLauncher','Makarov']]
	]];
};


//--- Client only.
if (local player) then {
	//--- Import the needed Gear (Available from the gear menu), multiple gear can be used.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_TKGUE.sqf";
};

//--- Default Loadout [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
missionNamespace setVariable [Format["WFBE_%1_DefaultGear", _side], [
	['AKS_74_kobra','Makarov','Binocular','NVGoggles','ItemCompass','ItemMap','ItemRadio','ItemWatch'],
	['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','HandGrenade_East','HandGrenade_East','HandGrenade_East','SmokeShellRed','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
	['AKS_74_kobra','Makarov']
]];