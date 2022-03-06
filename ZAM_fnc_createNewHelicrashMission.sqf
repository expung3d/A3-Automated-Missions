MAZ_fnc_newHelicrashMission = {
	MAZ_fnc_crashSetPosition = {
		params ["_crater"];
		private _crashLocations = [[4426,14856.8,0],[4798.99,12639.2,0],[4877.75,20329.2,0],[5231.58,14871.2,0],[5578.27,17465.8,0],[6163.38,19324.6,0],[6449.08,13172.7,0],[6543.98,11516.5,0],[6718.32,19145.1,0],[7752.5,15274.9,0],[8158.96,20422.5,0],[8397.1,12966.5,0],[8819.66,11798.1,0],[8791.14,14868,0],[8897.55,9168.05,0],[8870,18726,0],[9221.45,22106.7,0],[9279.24,16893.5,0],[9595.95,18836.4,0],[10056.8,8474.84,0],[10412.4,15523.6,0],[10447,12258,0],[10673.2,8163.02,0],[10643.5,16961,0],[10664,14861.2,0],[10905,13319,0],[11107.4,20417.6,0],[11265.5,6763.46,0],[11418.7,8021.57,0],[11555.3,9178.9,0],[11652.9,16580.6,0],[11822.7,21807.9,0],[11970.8,17921.5,0],[12292.4,8427.08,0],[12290.6,14908.5,0],[12272.3,16782.4,0],[12707.5,20893,0],[12818,19687,0],[13025.3,21797.8,0],[13788.3,18012.9,0],[14277.1,22192.4,0],[14352.3,21860.1,0],[14630.3,21582.1,0],[15139,18725,0],[16196.8,20505.8,0],[16511,9939,0],[16633,16039,0],[16757.5,18699.3,0],[16823,17206,0],[17268,17010,0],[17489,12283,0],[17680,15862.8,0],[18060.6,17167.3,0],[18200,10589,0],[18449.8,7986.42,0],[18442.5,14388.5,0],[18836.6,11992,0],[18850.1,17212,0],[19274,14905,0],[19455.6,7522.52,0],[19433,15434,0],[19616.9,8790.04,0],[19673.1,18544.6,0],[19896.6,6270.58,0],[20087,11211,0],[20075.9,19464.4,0],[20148.9,17218,0],[20283.4,13243.4,0],[20763,14738,0],[20747.2,18601.4,0],[20799.7,19459.5,0],[20959.8,10528.6,0],[20940.1,16583.9,0],[21099,13434,0],[21290.6,19486.8,0],[21491.1,8666.78,0],[21628.6,21366.1,0],[21746.5,16236.1,0],[21844.3,7684.46,0],[21975.9,18559.1,0],[21993,15601.4,0],[22062.4,21577.7,0],[22049.4,20284.7,0],[22190.1,15193,0],[22280.9,20129.4,0],[22425.9,21824.4,0],[22604.7,22341.4,0],[22693.9,22075.5,0],[23106.8,21565.2,0],[23538.1,20580.1,0],[23755.2,22248.2,0],[23718.1,23545.8,0],[23900.7,23003.5,0],[24009.6,21359.9,0],[24143.3,23747.1,0],[24365,22093,0],[24527.1,23024.5,0],[24692.7,20078,0],[24708,21195.1,0],[24721.8,23393,0],[24952,20877,0],[25226,19954,0],[25563.3,19567.9,0],[25551.8,22500.9,0],[25574.9,20376.8,0],[25687,21512,0],[25765,22222,0],[26024.9,19984.3,0],[26259.4,20418.7,0],[26685.8,21184.4,0],[27493.4,21481.1,0],[27631.7,23592.4,0],[27672.3,23252.4,0],[27887.2,22497.3,0]];
		private _position = selectRandom _crashLocations;
		_crater setPosATL _position;
		_crater setVectorUp surfaceNormal position _crater;
		private _randomDir = round (random 360);
		_crater setDir _randomDir;
		_position;
	};

	MAZ_fnc_createSoldierMission = {
		params ["_location","_groupSize"];
		private _position = [[[_location,50]],[]] call BIS_fnc_randomPos;
		private _unitLoadouts = [
			[["arifle_Katiba_F","","acc_pointer_IR","optic_ACO_grn",["30Rnd_65x39_caseless_green",30],[],""],[],[],["U_O_CombatUniform_ocamo",[["FirstAidKit",5]]],["V_HarnessO_brn",[["HandGrenade",2,1],["SmokeShell",2,1],["SmokeShellGreen",1,1],["30Rnd_65x39_caseless_green",11,30]]],[],"H_HelmetLeaderO_ocamo","",[],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","O_NVGoggles_hex_F"]],
			[["arifle_AK12U_F","","acc_pointer_IR","optic_ACO_grn",["30Rnd_762x39_AK12_Mag_F",30],[],""],[],[],["U_O_CombatUniform_ocamo",[["FirstAidKit",5]]],["V_HarnessO_brn",[["HandGrenade",2,1],["SmokeShell",2,1],["SmokeShellGreen",1,1],["30Rnd_762x39_AK12_Mag_F",5,30]]],[],"H_HelmetLeaderO_ocamo","",[],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","O_NVGoggles_hex_F"]],
			[["arifle_CTAR_hex_F","","acc_pointer_IR","optic_Arco",["30Rnd_580x42_Mag_F",30],[],""],[],[],["U_O_CombatUniform_ocamo",[["FirstAidKit",5]]],["V_HarnessO_brn",[["HandGrenade",2,1],["SmokeShell",2,1],["SmokeShellGreen",1,1],["30Rnd_580x42_Mag_F",5,30]]],[],"H_HelmetLeaderO_ocamo","",[],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","O_NVGoggles_hex_F"]],
			[["srifle_DMR_01_F","","","optic_DMS",["10Rnd_762x54_Mag",10],[],""],[],[],["U_O_CombatUniform_ocamo",[["FirstAidKit",5]]],["V_HarnessO_brn",[["HandGrenade",2,1],["SmokeShell",2,1],["SmokeShellGreen",1,1],["10Rnd_762x54_Mag",5,10]]],[],"H_HelmetLeaderO_ocamo","",[],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","O_NVGoggles_hex_F"]],
			[["LMG_Zafir_F","","","optic_Holosight",["150Rnd_762x54_Box",150],[],""],[],[],["U_O_CombatUniform_ocamo",[["FirstAidKit",5]]],["V_HarnessO_brn",[["HandGrenade",2,1],["SmokeShell",2,1],["SmokeShellGreen",1,1],["150Rnd_762x54_Box",1,150]]],[],"H_HelmetLeaderO_ocamo","",[],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","O_NVGoggles_hex_F"]]
		];

		private _soldiersCreated = [];
		private _soldierGroup = createGroup [east,true];
		for "_i" from 0 to (_groupSize-1) do {
			private _soldier = _soldierGroup createUnit ["O_Soldier_F",[23405.7,17895.8,0],[],0,"CAN_COLLIDE"];
			_soldier setPosATL _position;
			_soldier setVectorDirAndUp [[0,1,0],[0,0,1]];
			_soldier setUnitLoadout (selectRandom _unitLoadouts);
			_soldier setUnitPos "UP";

			[_soldierGroup,0] setWaypointPosition [position leader _soldierGroup,0];
			_soldierGroup setGroupID ["Alpha 1-1"];;

			_soldiersCreated pushBack _soldier;
		};
		_soldierGroup selectLeader (_soldiersCreated select 0);
		_soldierGroup allowFleeing 0;

		comment "Add waypoints";
		_position = [[[_location,35]],[]] call BIS_fnc_randomPos;
		private _moveWaypoint = _soldierGroup addWaypoint [_position,0];
		_moveWaypoint setWaypointType "MOVE";
		_moveWaypoint setWaypointBehaviour "SAFE";
		_moveWaypoint setWaypointSpeed "LIMITED";

		_position = [[[_location,35]],[]] call BIS_fnc_randomPos;
		_moveWaypoint = _soldierGroup addWaypoint [_position,0];
		_moveWaypoint setWaypointType "MOVE";
		_moveWaypoint setWaypointBehaviour "SAFE";
		_moveWaypoint setWaypointSpeed "LIMITED";

		_position = [[[_location,35]],[]] call BIS_fnc_randomPos;
		_moveWaypoint = _soldierGroup addWaypoint [_position,0];
		_moveWaypoint setWaypointType "MOVE";
		_moveWaypoint setWaypointBehaviour "SAFE";
		_moveWaypoint setWaypointSpeed "LIMITED";

		_position = [[[_location,35]],[]] call BIS_fnc_randomPos;
		_moveWaypoint = _soldierGroup addWaypoint [_position,0];
		_moveWaypoint setWaypointType "MOVE";
		_moveWaypoint setWaypointBehaviour "SAFE";
		_moveWaypoint setWaypointSpeed "LIMITED";

		_position = [[[_location,35]],[]] call BIS_fnc_randomPos;
		_moveWaypoint = _soldierGroup addWaypoint [_position,0];
		_moveWaypoint setWaypointType "MOVE";
		_moveWaypoint setWaypointBehaviour "SAFE";
		_moveWaypoint setWaypointSpeed "LIMITED";

		_position = [[[_location,35]],[]] call BIS_fnc_randomPos;
		private _cycleWaypoint = _soldierGroup addWaypoint [_position,0];
		_cycleWaypoint setWaypointType "CYCLE";
		_cycleWaypoint setWaypointBehaviour "SAFE";
		_cycleWaypoint setWaypointSpeed "LIMITED";


		_soldiersCreated;
	};

	MAZ_fnc_createSmokeForCrash = {
		params ["_position"];
		private _smokeNfire = createVehicle ["test_EmptyObjectForSmoke",_position,[],0,"CAN_COLLIDE"];
		_smokeNfire
	};

	MAZ_fnc_createReward = {
		params ["_location","_type"];
		private _position = [[[_location,15]],[]] call BIS_fnc_randomPos;
		
		private _crate = nil;
		switch (_type) do {
			case "guns": {
				_crate = createVehicle ["Box_NATO_Ammo_F",[16876.3,12244,0],[],0,"CAN_COLLIDE"];
				_crate setPos _position;
				_crate setVectorDirAndUp [[0,1,0],[-0.0346379,0,0.9994]];
				[_crate,"[[[[""arifle_Katiba_F"",""arifle_ARX_blk_F"",""arifle_CTAR_hex_F"",""arifle_RPK12_F"",""arifle_MSBS65_black_F"",""LMG_Zafir_F"",""srifle_DMR_01_F"",""srifle_DMR_04_F"",""srifle_DMR_05_blk_F"",""launch_O_Vorona_brown_F""],[5,2,5,1,2,2,3,2,2,1]],[[""30Rnd_65x39_caseless_green"",""30Rnd_762x39_AK12_Mag_F"",""75rnd_762x39_AK12_Mag_F"",""10Rnd_50BW_Mag_F"",""30Rnd_580x42_Mag_F"",""30Rnd_65x39_caseless_msbs_mag"",""150Rnd_762x54_Box"",""10Rnd_762x54_Mag"",""10Rnd_127x54_Mag"",""10Rnd_93x64_DMR_05_Mag"",""Vorona_HEAT""],[20,4,2,3,12,8,4,12,5,8,1]],[[""muzzle_snds_B"",""optic_Arco"",""optic_Aco"",""optic_ACO_grn"",""optic_Holosight"",""acc_flashlight"",""acc_pointer_IR"",""optic_DMS"",""optic_AMS"",""optic_KHS_hex"",""muzzle_snds_58_hex_F"",""muzzle_snds_65_TI_blk_F"",""optic_Holosight_blk_F"",""optic_ico_01_black_f"",""optic_Arco_AK_blk_F"",""optic_DMS_weathered_Kir_F"",""Laserdesignator_02"",""FirstAidKit""],[2,4,4,4,4,5,5,4,4,3,3,3,4,3,2,3,10,20]],[[],[]]],false]"] call bis_fnc_initAmmoBox;;
			};
			case "equip": {
				_crate = createVehicle ["Box_NATO_Equip_F",[16877,12245,0],[],0,"CAN_COLLIDE"];
				_crate setPos _position;
				_crate setVectorDirAndUp [[0.774188,0.632387,0.0268383],[-0.0346456,0,0.9994]];
				[_crate,"[[[[],[]],[[],[]],[[""H_Cap_tan_specops_US"",""H_MilCap_mcamo"",""H_Booniehat_mcamo"",""H_Booniehat_tan"",""H_HelmetB_light"",""H_HelmetB_light_black"",""H_HelmetB_light_desert"",""H_HelmetB_light_grass"",""H_HelmetB_light_sand"",""H_HelmetB_light_snakeskin"",""H_HelmetB_black"",""H_HelmetB_camo"",""H_HelmetB_desert"",""H_HelmetB_grass"",""H_HelmetB_sand"",""H_HelmetB_snakeskin"",""H_HelmetSpecB"",""H_HelmetSpecB_blk"",""H_HelmetSpecB_paint2"",""H_HelmetSpecB_paint1"",""H_HelmetSpecB_sand"",""H_HelmetSpecB_snakeskin"",""H_HelmetCrew_B"",""H_PilotHelmetFighter_B"",""H_PilotHelmetHeli_B"",""H_CrewHelmetHeli_B"",""H_HelmetB_TI_tna_F"",""H_HelmetB_tna_F"",""H_HelmetB_Enh_tna_F"",""H_HelmetB_Light_tna_F"",""H_Booniehat_tna_F"",""V_Rangemaster_belt"",""V_BandollierB_blk"",""V_BandollierB_rgr"",""V_Chestrig_blk"",""V_Chestrig_rgr"",""V_TacVest_blk"",""V_PlateCarrier1_blk"",""V_PlateCarrier1_rgr"",""V_PlateCarrier2_rgr"",""V_PlateCarrier2_blk"",""V_PlateCarrierGL_blk"",""V_PlateCarrierGL_rgr"",""V_PlateCarrierGL_mtp"",""V_PlateCarrierSpec_blk"",""V_PlateCarrierSpec_rgr"",""V_PlateCarrierSpec_mtp"",""V_RebreatherB"",""V_TacChestrig_grn_F"",""V_PlateCarrier1_tna_F"",""V_PlateCarrier2_tna_F"",""V_PlateCarrierSpec_tna_F"",""V_PlateCarrierGL_tna_F"",""V_BandollierB_ghex_F"",""V_PlateCarrier1_rgr_noflag_F"",""V_PlateCarrier2_rgr_noflag_F""],[2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2]],[[],[]]],false]"] call bis_fnc_initAmmoBox;;
			};
		};
		_crate;
	};

	MAZ_fnc_crashSounds = {
		params ["_helicopter","_newPos"];
		[_helicopter,_newPos] spawn {
			params ["_helicopter","_newPos"];
			playSound3D ["A3\sounds_f\vehicles\crashes\helis\heli_crash_ground_ext_4.wss",_helicopter,false,_newPos, 5, 1, 5500];
			sleep 0.5;
			playSound3D ["A3\sounds_f\vehicles\air\noises\heli_damage_rotor_ext_2.wss",_helicopter,false,_newPos, 5, 1, 1000];
			while {!(isNull _helicopter)} do {
				playSound3D ["A3\sounds_f\vehicles\air\noises\heli_alarm_bluefor.wss",_helicopter,false,getPosASL _helicopter, 5, 1, 30];
				sleep 2.05;
			};
		};
	};

	private _craterCrash = createVehicle ["CraterLong",[23413.8,17893.8,0],[],0,"CAN_COLLIDE"];
	_craterCrash setPosWorld [23413.8,17893.8,3.25423];
	_craterCrash setVectorDirAndUp [[0,1,0],[0,0,1]];

	private _crashGhosthawk = createVehicle ["B_Heli_Transport_01_F",[23415.3,17894.2,-1.035],[],0,"CAN_COLLIDE"];
	_crashGhosthawk setPosWorld [23414.6,17894.2,4.17478];
	_crashGhosthawk setVectorDirAndUp [[0,0.95921,-0.282693],[0.46759,0.249885,0.84789]];
	_crashGhosthawk setDamage [0.62284,false];
	_crashGhosthawk lock 2;
	_crashGhosthawk enableSimulation false;
	[_crashGhosthawk,_craterCrash] call BIS_fnc_attachToRelative;
	private _newPos = [_craterCrash] call MAZ_fnc_crashSetPosition;
	[_crashGhosthawk,_newPos] call MAZ_fnc_crashSounds;

	private _positionOfCrash = getPos _craterCrash;
	private _smokeObject = [_positionOfCrash] call MAZ_fnc_createSmokeForCrash;
	private _crashItems = [_craterCrash,_crashGhosthawk,_smokeObject];
	["TaskAssignedIcon",["A3\UI_F\Data\Map\Markers\Military\warning_CA.paa","Helicopter Crash"]] remoteExec ['BIS_fnc_showNotification',0];
	private _heliCrashMarker = createMarker ["heliCrashMarker_0",_positionOfCrash];
	_heliCrashMarker setMarkerText "Helicopter Crash";
	_heliCrashMarker setMarkerType "mil_objective";
	_heliCrashMarker setMarkerColor "ColorEAST";

	private _randomAmountOfEnemies = round (random [10,15,20]);
	private _groupSize = round (random [1,2,3]);
	_randomAmountOfEnemies = round (_randomAmountOfEnemies/_groupSize);
	private _soldiersArray = [];
	for "_i" from 0 to _randomAmountOfEnemies do {
		private _soldiersCreated = [_positionOfCrash,_groupSize] call MAZ_fnc_createSoldierMission;
		{
			_soldiersArray pushBack _x;
		}forEach _soldiersCreated;
	};


	[_soldiersArray,_heliCrashMarker,_crashItems] spawn {
		params ["_soldiersArray","_heliCrashMarker","_crashItems"];
		private _timer = 900;
		while {_timer > 0 && (({alive _x} count _soldiersArray) != 0)} do {
			_timer = _timer - 1;
			sleep 1;
		};
		if(({alive _x} count _soldiersArray) == 0) then {
			["TaskSucceeded",["","Helicopter Crash Secured"]] remoteExec ['BIS_fnc_showNotification',0];
			private _randomAmount = selectRandom [1,2];
			private _rewardBoxes = [];
			for "_i" from 0 to (_randomAmount-1) do {
				private _rewardType = selectRandom ["guns","equip"];
				private _rewardBox = [getPos (_crashItems select 0),_rewardType] call MAZ_fnc_createReward;
				_rewardBoxes pushBack _rewardBox;
			};
			deleteMarker _heliCrashMarker;
			sleep 90;
			waitUntil {{isPlayer _x} count ((_crashItems select 0) nearEntities ["Man",1600]) == 0};
			{
				deleteVehicle _x;
			} forEach _crashItems + _soldiersArray + _rewardBoxes;
		};
		if(_timer <= 0 && (({alive _x} count _soldiersArray) != 0)) then {
			["TaskFailed",["","Helicopter Crash Not Secured"]] remoteExec ['BIS_fnc_showNotification',0];
			deleteMarker _heliCrashMarker;
			{
				deleteVehicle _x;
			} forEach _crashItems + _soldiersArray;
		};
		sleep 600;
		[] call MAZ_fnc_newHelicrashMission;
	};
};
