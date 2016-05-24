MACHINE           User_Manager

USES              set_USER, set_PASSWORD, set_LOGGED

VARIABLES         login_info, current_user, logged

INVARIANT         login_info : USER --> PASSWORD & current_user : USER & logged : USER --> LOGGED

INITIALISATION    login_info := {} || current_user := noone

OPERATIONS

	registrar(user, pass) =
	PRE user /: USER THEN
		login_info := login_info /\ {user |-> pass}
	END;

	login(user, pass) =
	PRE login_info(user) = pass THEN
		logged(user) := on
		current_user := user
	END;

	logout =
	PRE current_user /= noone THEN
		logged(current_user) := off
		current_user := noone
	END

END