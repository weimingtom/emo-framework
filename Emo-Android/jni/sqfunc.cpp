#include <stdarg.h>
#include <stdio.h>
#include <string.h>

#include <squirrel.h>
#include <sqstdio.h>
#include <sqstdaux.h>

#include <common.h>
#include <sqfunc.h>

/*
 * Logging
 */
extern void LOGI(const SQChar* msg);
extern void LOGW(const SQChar* msg);
extern void LOGE(const SQChar* msg);

/*
 * Initialize Squirrel VM
 */
void initSQVM(HSQUIRRELVM v) {
	sqstd_seterrorhandlers(v);
	sq_setprintfunc(v, sq_printfunc, sq_errorfunc);
}

/*
 * Comple script buffers
 */
SQInteger sqCompileBuffer(HSQUIRRELVM v, const char* script, const char* sourcename) {
	if (SQ_SUCCEEDED(sq_compilebuffer(v, script, scstrlen(script), sourcename, SQTrue))) {
		sq_pushroottable(v);
		if (SQ_FAILED(sq_call(v, 1, SQFalse, SQTrue))) {
			return ERR_SCRIPT_CALL_ROOT;
		}
	} else {
		return ERR_SCRIPT_COMPILE;
	}
	return EMO_NO_ERROR;
}

/*
 * Call Squirrel function with no parameter
 * Returns SQTrue if sq_call succeeds.
 */
SQBool callSqFunction(HSQUIRRELVM v, const SQChar* name) {
	SQBool result = SQFalse;

	SQInteger top = sq_gettop(v);
	sq_pushroottable(v);
	sq_pushstring(v, name, -1);
	if(SQ_SUCCEEDED(sq_get(v, -2))) {
		sq_pushroottable(v);
		result = SQ_SUCCEEDED(sq_call(v, 1, SQFalse, SQTrue));
	}
	sq_settop(v,top);

	return result;
}
/*
 * Call Squirrel function with no parameter, returns integer
 * Returns default value if sq_call failed.
 */
SQInteger callSqFunction_Int(HSQUIRRELVM v, const SQChar* name, SQInteger defaultValue) {
	SQInteger result = defaultValue;

	SQInteger top = sq_gettop(v);
	sq_pushroottable(v);
	sq_pushstring(v, name, -1);
	if(SQ_SUCCEEDED(sq_get(v, -2))) {
		sq_pushroottable(v);
		if (SQ_SUCCEEDED(sq_call(v, 1, SQTrue, SQTrue))) {
			sq_getinteger(v, sq_gettop(v), &result);
		}
	}
	sq_settop(v,top);

	return result;
}
/*
 * Call Squirrel function with no parameter, returns boolean
 * Returns the default value if sq_call failed.
 */
SQBool callSqFunction_Bool(HSQUIRRELVM v, const SQChar* name, SQBool defaultValue) {
	SQBool result = defaultValue;

	SQInteger top = sq_gettop(v);
	sq_pushroottable(v);
	sq_pushstring(v, name, -1);
	if(SQ_SUCCEEDED(sq_get(v, -2))) {
		sq_pushroottable(v);
		if (SQ_SUCCEEDED(sq_call(v, 1, SQTrue, SQTrue))) {
			sq_getbool(v, sq_gettop(v), &result);
		}
	}
	sq_settop(v,top);

	return result;
}

/*
 * Call Squirrel function with multiple float parameters, returns boolean
 * Returns default value if sq_call failed.
 */
SQBool callSqFunction_Bool_Floats(HSQUIRRELVM v, const SQChar* name, SQFloat param[], int count, SQBool defaultValue) {
	SQBool   result = defaultValue;

	SQInteger top = sq_gettop(v);
	sq_pushroottable(v);
	sq_pushstring(v, name, -1);
	if(SQ_SUCCEEDED(sq_get(v, -2))) {
		sq_pushroottable(v);
		for (int i = 0; i < count; i++) {
			sq_pushfloat(v, param[i]);
		}
		if (SQ_SUCCEEDED(sq_call(v, count + 1, SQTrue, SQTrue))) {
			sq_getbool(v, sq_gettop(v), &result);
		}
	}
	sq_settop(v,top);

	return result;
}

/*
 * Call Squirrel function with one integer parameter, returns integer
 * Returns default value if sq_call failed.
 */
SQInteger callSqFunction_Int_Int(HSQUIRRELVM v, const SQChar* name, SQInteger param, SQInteger defaultValue) {
	SQInteger result = defaultValue;

	SQInteger top = sq_gettop(v);
	sq_pushroottable(v);
	sq_pushstring(v, name, -1);
	if(SQ_SUCCEEDED(sq_get(v, -2))) {
		sq_pushroottable(v);
		sq_pushinteger(v, param);
		if (SQ_SUCCEEDED(sq_call(v, 2, SQTrue, SQTrue))) {
			sq_getinteger(v, sq_gettop(v), &result);
		}
	}
	sq_settop(v,top);

	return result;
}


/*
 * Call Squirrel function with one string parameter
 * Returns SQTrue if sq_call succeeds.
 */
SQBool callSqFunction_Bool_String(HSQUIRRELVM v, const SQChar* name, const SQChar* value) {
	SQBool result = SQFalse;

	SQInteger top = sq_gettop(v);
	sq_pushroottable(v);
	sq_pushstring(v, name, -1);
	if(SQ_SUCCEEDED(sq_get(v, -2))) {
		sq_pushroottable(v);
		sq_pushstring(v, value, -1);
		result = SQ_SUCCEEDED(sq_call(v, 2, SQFalse, SQTrue));
	}
	sq_settop(v,top);

	return result;
}

/*
 * Call Squirrel function with one integer parameter
 * Returns SQTrue if sq_call succeeds.
 */
SQBool callSqFunction_Bool_Int(HSQUIRRELVM v, const SQChar* name, SQInteger value) {
	SQBool result = SQFalse;

	SQInteger top = sq_gettop(v);
	sq_pushroottable(v);
	sq_pushstring(v, name, -1);
	if(SQ_SUCCEEDED(sq_get(v, -2))) {
		sq_pushroottable(v);
		sq_pushinteger(v, value);
		result = SQ_SUCCEEDED(sq_call(v, 2, SQFalse, SQTrue));
	}
	sq_settop(v,top);

	return result;
}

/*
 * Call Squirrel function with one integer parameter
 * Returns SQTrue if sq_call succeeds.
 */
SQBool callSqFunction_Bool_Bool(HSQUIRRELVM v, const SQChar* name, SQBool value) {
	SQBool result = SQFalse;

	SQInteger top = sq_gettop(v);
	sq_pushroottable(v);
	sq_pushstring(v, name, -1);
	if(SQ_SUCCEEDED(sq_get(v, -2))) {
		sq_pushroottable(v);
		sq_pushbool(v, value);
		result = SQ_SUCCEEDED(sq_call(v, 2, SQFalse, SQTrue));
	}
	sq_settop(v,top);

	return result;
}

/*
 * print function
 */
void sq_printfunc(HSQUIRRELVM v, const SQChar *s,...) {
	static SQChar text[2048];
	va_list args;
    va_start(args, s);
    scvsprintf(text, s, args);
    va_end(args);

    LOGI(text);
}
/*
 * error function
 */
void sq_errorfunc(HSQUIRRELVM v, const SQChar *s,...) {
	static SQChar text[2048];
	va_list args;
    va_start(args, s);
    scvsprintf(text, s, args);
    va_end(args);

    callSqFunction_Bool_String(v, "onError", text);

    LOGW(text);
}
/*
 * Register global function
 * Must be called before loading script files
 */
void register_global_func(HSQUIRRELVM v, SQFUNCTION f, const char *fname) {
    sq_pushroottable(v);
    sq_pushstring(v, fname, -1);
    sq_newclosure(v, f, 0);
    sq_createslot(v, -3);
    sq_pop(v,1);
}
