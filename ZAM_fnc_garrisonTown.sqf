/*
	Garrison Town by Expung3d

	Automatically garrisons a percentage of building within a town and creates patrols. 
	Dynamic and recognizes all towns known by the engine that are configured in the map. 

	Note:
		Does not include a GUI to easily call this function. A simple one can be easily made.

	Syntax:
		0: STRING - Town name
		1: SIDE - Side of garrison (Default EAST)
		2: NUMBER - Percent of garrison (Default 0.2 or 20%)
		3: NUMBER - Number of patrols (Default 3)

	Example:
		["Athira",east,0.2,3] call MAZ_EZM_fnc_callGarrisonTown;

*/

MAZ_EZM_fnc_garrisonGroup = {
	params [
		["_group",grpNull,[grpNull]]
	];
	if(isNull _group) exitWith {};

	private _leader = leader _group;
	private _previousBehaviour = behaviour _leader;

	private _arrayShuffle = {
		private _array = _this select 0;
		private _count = count _array;
		private _arrayN = [];
		private _arrayT = [];
		private _c = 0;
		private _r = 0;

		while {_c < _count} do
		{
			while {_r in _arrayT} do
			{_r = floor (random _count);
			};
			_arrayT pushBack _r;
			_arrayN set [_c, _array select _r];
			_c = _c + 1;
		};

		_arrayN
	};

	private _fnc_getHousePositions = {
		params ["_index","_houses"];
		private _nearestBuilding = _houses select _index;
		if(isNil "_nearestBuilding") exitWith {};
		private _positionsInBuilding = [_nearestBuilding] call BIS_fnc_buildingPositions;
		_positionsInBuilding = [_positionsInBuilding] call _arrayShuffle;
		_positionsInBuilding
	};

	private _fnc_orderToPositions = {
		params ["_units","_positions","_houseIndex"];
		private _newUnits = _units;
		{
			private _unit = objNull;
			if((count _units) -1 >= _forEachIndex) then {
				private _unit = _units select _forEachIndex;
				_unit setPos _x;
				_newUnits = _newUnits - [_unit];
				_unit forceSpeed 0;
			};
		}forEach _positions;
		if((count _buildingPoses) < (count _units)) then {
			_houseIndex = _houseIndex + 1;
			_buildingPoses = [_houseIndex,_nearestBuildings] call _fnc_getHousePositions;
			[_newUnits,_buildingPoses,_houseIndex] call _fnc_orderToPositions;
		};
	};

	{
		deleteWaypoint [_group,_forEachIndex];
	}forEach (waypoints _group);

	private _nearestBuildings = nearestObjects [getPos _leader, ["building"], 50, true];

	if (_nearestBuildings isEqualTo []) exitWith { false };
	_group setbehaviour "AWARE";

	private _houseIndex = 0;
	private _buildingPoses = [_houseIndex,_nearestBuildings] call _fnc_getHousePositions;

	private _units = (units _group) select {!isNull _x && alive _x};

	[_units,_buildingPoses,_houseIndex] call _fnc_orderToPositions;

	true
};

MAZ_EZM_fnc_garrisonTown = {
	params [
		["_town","NONE",[""]],
		["_side",east,[east]],
		["_percentGarrison",0.2,[0.2]],
		["_numOfPatrols",selectRandom [2,3,4],[3]]
	];
	copyToClipboard (str _side);
	if(_side isEqualTo civilian) exitWith {false};

	private ["_position","_sizeTown"];
	_town = toUpper _town;
	private _locations = [];
	{	
		{	
			_locations pushBack [toUpper (text _x), locationPosition _x,size _x];
		} forEach nearestLocations [getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition"), [_x], worldSize];	
	} forEach ["NameVillage", "NameCity", "NameCityCapital"];
	if(_town == "NONE" || _town == "") then {
		_position = [] call MAZ_EZM_fnc_getScreenPosition;
		_sizeTown = 200;
	} else {
		private _index = _locations findIf {(_x select 0) == _town};
		_townData = _locations select _index;
		_town = _townData select 0;
		_position = _townData select 1;
		(_townData select 2) params ["_x","_y"];
		_sizeTown = (_x max _y) * 0.75;
	};
	private _townAlert = format ["%1 IS UNDER ATTACK",toUpper _town];
	if(toUpper _town == "NONE") then {
		_townAlert = "A TOWN IS UNDER ATTACK";
	};

	private _fnc_getUnitTypes = {
		params [
			"_side"
		];
		private _return = [];
		switch (_side) do {
			case west: {
				switch (worldName) do {
					case "Stratis";
					case "Malden";
					case "Altis": {
						_return = [
							"B_Soldier_A_F",
							"B_Soldier_AR_F",
							"B_Medic_F",
							"B_Soldier_GL_F",
							"B_Soldier_M_F",
							"B_Soldier_F",
							"B_Soldier_LAT_F",
							"B_Soldier_LAT2_F"
						];
					};
					case "Tanoa": {
						_return = [
							"B_T_Soldier_A_F",
							"B_T_Soldier_AR_F",
							"B_T_Medic_F",
							"B_T_Soldier_GL_F",
							"B_T_Soldier_M_F",
							"B_T_Soldier_F",
							"B_T_Soldier_LAT_F",
							"B_T_Soldier_LAT2_F"
						];
					};
					case "Enoch": {
						_return = [
							"B_W_Soldier_A_F",
							"B_W_Soldier_AR_F",
							"B_W_Medic_F",
							"B_W_Soldier_GL_F",
							"B_W_Soldier_M_F",
							"B_W_Soldier_F",
							"B_W_Soldier_LAT_F",
							"B_W_Soldier_LAT2_F"
						];
					};
				};
			};
			case east: {
				switch (worldName) do {
					case "Stratis";
					case "Malden";
					case "Altis": {
						_return = [
							"O_Soldier_A_F",
							"O_Soldier_AR_F",
							"O_Medic_F",
							"O_Soldier_GL_F",
							"O_Soldier_M_F",
							"O_Soldier_F",
							"O_Soldier_LAT_F"
						];
					};
					case "Tanoa": {
						_return = [
							"O_T_Soldier_A_F",
							"O_T_Soldier_AR_F",
							"O_T_Medic_F",
							"O_T_Soldier_GL_F",
							"O_T_Soldier_M_F",
							"O_T_Soldier_F",
							"O_T_Soldier_LAT_F"
						];
					};
					case "Enoch": {
						_return = [
							"O_R_JTAC_F",
							"O_R_Soldier_AR_F",
							"O_R_Medic_F",
							"O_R_Soldier_GL_F",
							"O_R_Soldier_M_F",
							"O_R_Soldier_LAT_F"
						]
					};
				};
			};
			case independent: {
				switch (worldName) do {
					case "Stratis";
					case "Malden";
					case "Altis": {
						_return = [
							"I_Soldier_A_F",
							"I_Soldier_AR_F",
							"I_Medic_F",
							"I_Soldier_GL_F",
							"I_Soldier_M_F",
							"I_Soldier_F",
							"I_Soldier_LAT_F",
							"I_Soldier_LAT2_F"
						];
					};
					case "Tanoa": {
						_return = [
							"I_C_Soldier_Para_7_F",
							"I_C_Soldier_Para_3_F",
							"I_C_Soldier_Para_4_F",
							"I_C_Soldier_Para_6_F",
							"I_C_Soldier_Para_8_F",
							"I_C_Soldier_Para_1_F",
							"I_C_Soldier_Para_5_F"
						];
					};
					case "Enoch": {
						_return = [
							"I_E_Soldier_A_F",
							"I_E_Soldier_AR_F",
							"I_E_Medic_F",
							"I_E_Soldier_GL_F",
							"I_E_Soldier_M_F",
							"I_E_Soldier_F",
							"I_E_Soldier_LAT_F",
							"I_E_Soldier_LAT2_F"
						];
					};
				};
			};
		};
		_return
	};
	private _unitTypes = [_side] call _fnc_getUnitTypes;
	private _buildings = nearestTerrainObjects [_position,["BUILDING","HOUSE"],_sizeTown];
	private _units = [];
	{
		if((random 1) < _percentGarrison) then {
			private _randomNumOfUnits = [2,5] call BIS_fnc_randomInt;
			private _grp = createGroup [_side,true];
			for "_i" from 1 to _randomNumOfUnits do {
				private _unitType = selectRandom _unitTypes;
				private _unit = _grp createUnit [_unitType,_x,[],0,"CAN_COLLIDE"];
				_unit setSkill 0.4;
				_unit setUnitPos "UP";
				_units pushBack _unit;
			};
			[_grp] call MAZ_EZM_fnc_garrisonGroup;
		};
	}forEach _buildings;

	for "_i" from 0 to _numOfPatrols do {
		private _randPos = [[[_position,150]]] call BIS_fnc_randomPos;
		private _nearRoads = _randPos nearRoads 150;
		private _nearRoad = getPos (selectRandom _nearRoads);
		private _randomNumOfUnits = [4,6] call BIS_fnc_randomInt;

		private _grp = createGroup [_side,true];
		for "_j" from 1 to _randomNumOfUnits do {
			private _unitType = selectRandom _unitTypes;
			private _unit = _grp createUnit [_unitType, _nearRoad,[],0,"CAN_COLLIDE"];
			_unit setSkill 0.4;
			_unit setUnitPos "UP";
			_units pushBack _unit;
		};

		for "_j" from 0 to 5 do {
			private _waypoint = _grp addWaypoint [getPos (selectRandom _nearRoads),0];
			_waypoint setWaypointType "MOVE";
			_waypoint setWaypointBehaviour "SAFE";
			_waypoint setWaypointSpeed "LIMITED";
		};
		private _waypoint = _grp addWaypoint [_nearRoad,0];
		_waypoint setWaypointType "CYCLE";
		_waypoint setWaypointBehaviour "SAFE";
		_waypoint setWaypointSpeed "LIMITED";
	};

	[[_units],{
		params ["_objs"];
		{
			_x addCuratorEditableObjects [_objs,true];
		} foreach allCurators;
	}] remoteExec ["Spawn",2];

	["TaskAssignedIcon",["A3\UI_F\Data\Map\Markers\Military\warning_CA.paa",_townAlert]] remoteExec ['BIS_fnc_showNotification',0];

	true
};

MAZ_EZM_fnc_callGarrisonTown = {
	params ["_town",["_side",east],["_percentGarrison",0.2],["_patrols",3]];
	private _locationNames = [];
	{	
		private _lct = _forEachIndex;
		{	
			_locationNames pushBack (toUpper (text _x));
		} forEach nearestLocations [getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition"), [_x], worldSize];	
	} forEach ["NameVillage", "NameCity", "NameCityCapital"];
	if(!(toUpper _town in _locationNames)) exitWith {playSound "addItemFailed"; systemChat "[ Enhanced Zeus Modules ] : No such town!"};
	[_town,_side,_percentGarrison,_patrols] spawn MAZ_EZM_fnc_garrisonTown;
};