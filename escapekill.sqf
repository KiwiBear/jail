_unit = _this select 0;

if (!alive _unit) exitWith {isKiller=false;};
waitUntil {inJail};

sleep 2;

waitUntil {_unit distance Prison > 105};
_array = _this;
_source = _array select 0;
_cost = -(20000);
PVDZE_send = [_source,"Humanity",[_source,_cost,0]];
publicVariableServer "PVDZE_send";
call dayz_forceSave;
if ((inJail) && (alive _unit) && (_unit distance jail_center_H > 105)) then {

	_sfx="dieScream";
	_nul = [objNull, _unit, rSAY, _sfx] call RE;
	
	sleep 2.7;
    call dayz_forceSave;
	_sfx="finalShot";
	_nul = [objNull, _unit, rSAY, _sfx] call RE;
	sleep 0.5;

    _unit SetDamage 1;
			
};

customRemoteMessage = ['globalChat', "I was shot dead trying to escape from Prison", _unit];
publicVariable "customRemoteMessage";

inJail=false;
isKiller=false;
