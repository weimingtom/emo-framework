#include <EmoDrawable.h>
#include <squirrel.h>
#include <common.h>
#include <sqfunc.h>
#include <EmoEngine.h>
#include <emo_engine_func.h>

extern EmoEngine* engine;

@implementation EmoDrawable
@synthesize name;
@synthesize x, y, z, width, height;
@synthesize hasTexture;
@synthesize texture;

-(BOOL)onDrawFrame:(NSTimeInterval)dt {
	// TODO
	return TRUE;
}
-(void)initDrawable {
	x = 0;
	y = 0;
	z = 0;
	width  = 0;
	height = 0;
	name = nil;

	hasTexture = false;

	// color param RGBA
    param_color[0] = 1.0f;
    param_color[1] = 1.0f;
    param_color[2] = 1.0f;
    param_color[3] = 1.0f;
	
    // rotate angle, center x, center y, axis
    param_rotate[0] = 0;
    param_rotate[1] = 0;
    param_rotate[2] = 0;
    param_rotate[3] = AXIS_Z;
	
    // scale param x, y, center x, center y
    param_scale[0] = 1;
    param_scale[1] = 1;
    param_scale[2] = 0;
    param_scale[3] = 0;
	
	glGenBuffers (1, vbo);
}
-(float)getTexCoordStartX {
    return 0;
}
-(float)getTexCoordStartY {
    return 0;
}
-(float)getTexCoordEndX {
    return texture.width / texture.glWidth;
}
-(float)getTexCoordEndY {
    return texture.height / texture.glHeight;
}

-(BOOL)bindVertex {
    clearGLErrors();
	
    vertex_tex_coords[0] = [self getTexCoordStartX];
    vertex_tex_coords[1] = [self getTexCoordStartY];
	
    vertex_tex_coords[2] = [self getTexCoordStartX];
    vertex_tex_coords[3] = [self getTexCoordEndY];
	
    vertex_tex_coords[4] = [self getTexCoordEndX];
    vertex_tex_coords[5] = [self getTexCoordEndY];
	
    vertex_tex_coords[6] = [self getTexCoordEndX];
    vertex_tex_coords[7] = [self getTexCoordStartY];
	
    glBindBuffer(GL_ARRAY_BUFFER, vbo[0]);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertex_tex_coords), vertex_tex_coords, GL_STATIC_DRAW);
	
    GLint error;
    if ((error = glGetError()) != GL_NO_ERROR) {
        char str[128];
        sprintf(str, "Could not create OpenGL buffers: code=0x%x", error);
        LOGE(str);
        return FALSE;
    }
	
	return TRUE;
}
-(void)updateKey:(char*)key {
	double uptime = [engine uptime];
	int uptimes = (int)floor(uptime);
	int uptimem = (int)floor((uptime - uptimes) * 1000);
    sprintf(key, "%d%d%d", uptimes, uptimem, vbo[0]);
}
-(void)setScale:(NSInteger)index withValue:(float)value {
	param_scale[index] = value;
}
-(void)setRotate:(NSInteger)index withValue:(float)value {
	param_rotate[index] = value;
}
-(void)setColor:(NSInteger)index withValue:(float)value {
	param_color[index] = value;
}

-(void)doUnload {
	if (hasTexture) {
		[texture doUnload];
		[texture release];
	}
	glDeleteBuffers(1, vbo);
}
-(void)dealloc {
	[name release];
	[super dealloc];
}
@end

/*
 * create drawable instance
 */
SQInteger emoDrawableCreateSprite(HSQUIRRELVM v) {
	EmoDrawable* drawable = [[[EmoDrawable alloc]init] autorelease];
	
    [drawable initDrawable];
	
    const SQChar* name;
    SQInteger nargs = sq_gettop(v);
    if (nargs >= 2 && sq_gettype(v, 2) == OT_STRING) {
        sq_tostring(v, 2);
        sq_getstring(v, -1, &name);
		
        if (strlen(name) > 0) {
            drawable.name = [[NSString alloc] initWithUTF8String:name];
        }
    }
	
    SQFloat x = 0;
    SQFloat y = 0;
    SQFloat z = 0;
	
    if (nargs >= 3) sq_getfloat(v, 3, &x);
    if (nargs >= 4) sq_getfloat(v, 4, &y);
    if (nargs >= 5) sq_getfloat(v, 5, &z);
	
    drawable.x    = x;
    drawable.y    = y;
    drawable.z    = z;
	
    char key[DRAWABLE_KEY_LENGTH];
	[drawable updateKey:key];
    [engine addDrawable:drawable withKey:key];
	
    sq_pushstring(v, key, strlen(key));
	
    return 1;
}

/*
 * load drawable
 */
SQInteger emoDrawableLoad(HSQUIRRELVM v) {
    const SQChar* id;
    SQInteger nargs = sq_gettop(v);
    if (nargs >= 2 && sq_gettype(v, 2) == OT_STRING) {
        sq_tostring(v, 2);
        sq_getstring(v, -1, &id);
        sq_poptop(v);
    } else {
        sq_pushinteger(v, ERR_INVALID_PARAM);
        return 1;
    }
	
    EmoDrawable* drawable = [engine getDrawable:id];
	
    if (drawable == nil) {
        sq_pushinteger(v, ERR_INVALID_ID);
        return 1;
    }
	
	EmoImage* imageInfo = [[EmoImage alloc]init];
    if (drawable.name != nil && loadPngFromResource(drawable.name, imageInfo)) {
		
        // calculate the size of power of two
        imageInfo.glWidth  = nextPowerOfTwo(imageInfo.width);
        imageInfo.glHeight = nextPowerOfTwo(imageInfo.height);
		
        drawable.texture = imageInfo;
        drawable.hasTexture = true;
        drawable.width  = imageInfo.width;
        drawable.height = imageInfo.height;
		
        // assign OpenGL texture id
		[imageInfo genTextures];
    } else {
        [imageInfo release];
        sq_pushinteger(v, ERR_ASSET_LOAD);
        return 1;
    }
	
    // drawable x
    if (nargs >= 3) {
        SQFloat x;
        sq_getfloat(v, 3, &x);
        drawable.x = x;
    }
	
    // drawable y
    if (nargs >= 4) {
        SQFloat y;
        sq_getfloat(v, 4, &y);
        drawable.y = y;
    }
	
    // drawable width
    if (nargs >= 5) {
        SQFloat width;
        sq_getfloat(v, 5, &width);
        drawable.width = width;
    }
	
    // drawable height
    if (nargs >= 6) {
        SQFloat height;
        sq_getfloat(v, 6, &height);
        drawable.height = height;
    }
	
    if ([drawable bindVertex]) {
        sq_pushinteger(v, EMO_NO_ERROR);
    } else {
        sq_pushinteger(v, ERR_CREATE_VERTEX);
    }
	
    return 1;
}

/*
 * move drawable
 */
SQInteger emoDrawableMove(HSQUIRRELVM v) {
    const SQChar* id;
    SQInteger nargs = sq_gettop(v);
    if (nargs >= 2 && sq_gettype(v, 2) == OT_STRING) {
        sq_tostring(v, 2);
        sq_getstring(v, -1, &id);
        sq_poptop(v);
    } else {
        sq_pushinteger(v, ERR_INVALID_PARAM);
        return 1;
    }
	
    EmoDrawable* drawable = [engine getDrawable:id];
	
    if (drawable == nil) {
        sq_pushinteger(v, ERR_INVALID_ID);
        return 1;
    }
	
    if (nargs >= 3) {
        SQFloat x;
        sq_getfloat(v, 3, &x);
        drawable.x = x;
    }
	
    if (nargs >= 4) {
        SQFloat y;
        sq_getfloat(v, 4, &y);
        drawable.y = y;
    }
	
    if (nargs >= 5) {
        SQFloat z;
        sq_getfloat(v, 5, &z);
        drawable.z = z;
    }
	return 0;
}

/*
 * scale drawable
 */
SQInteger emoDrawableScale(HSQUIRRELVM v) {
    const SQChar* id;
    SQInteger nargs = sq_gettop(v);
    if (nargs >= 2 && sq_gettype(v, 2) == OT_STRING) {
        sq_tostring(v, 2);
        sq_getstring(v, -1, &id);
        sq_poptop(v);
    } else {
        sq_pushinteger(v, ERR_INVALID_PARAM);
        return 1;
    }
	
    EmoDrawable* drawable = [engine getDrawable:id];
	
    if (drawable == nil) {
        sq_pushinteger(v, ERR_INVALID_ID);
        return 1;
    }
	
    // scale x
    if (nargs >= 3) {
        SQFloat f;
        sq_getfloat(v, 3, &f);
        [drawable setScale:0 withValue:f];
    }
	
    // scale y
    if (nargs >= 4) {
        SQFloat f;
        sq_getfloat(v, 4, &f);
        [drawable setScale:1 withValue:f];
    }
	
    // center x
    if (nargs >= 5) {
        SQFloat f;
        sq_getfloat(v, 5, &f);
        [drawable setScale:2 withValue:f];
    } else {
        [drawable setScale:2 withValue:drawable.width * 0.5f];
    }
	
    // center y
    if (nargs >= 6) {
        SQFloat f;
        sq_getfloat(v, 6, &f);
        [drawable setScale:3 withValue:f];
    } else {
        [drawable setScale:3 withValue:drawable.height * 0.5f];
    }
	
    return 0;
}

/*
 * rotate drawable
 */
SQInteger emoDrawableRotate(HSQUIRRELVM v) {
    const SQChar* id;
    SQInteger nargs = sq_gettop(v);
    if (nargs >= 2 && sq_gettype(v, 2) == OT_STRING) {
        sq_tostring(v, 2);
        sq_getstring(v, -1, &id);
        sq_poptop(v);
    } else {
        sq_pushinteger(v, ERR_INVALID_PARAM);
        return 1;
    }
	
    EmoDrawable* drawable = [engine getDrawable:id];
	
    if (drawable == nil) {
        sq_pushinteger(v, ERR_INVALID_ID);
        return 1;
    }
	
    // angle
    if (nargs >= 3) {
        SQFloat f;
        sq_getfloat(v, 3, &f);
        [drawable setRotate:0 withValue:f];
    }
	
    // center x
    if (nargs >= 4) {
        SQFloat f;
        sq_getfloat(v, 4, &f);
        [drawable setRotate:1 withValue:f];
    } else {
        [drawable setRotate:1 withValue:drawable.width * 0.5f];
    }
	
    // center y
    if (nargs >= 5) {
        SQFloat f;
        sq_getfloat(v, 5, &f);
        [drawable setRotate:2 withValue:f];
    } else {
        [drawable setRotate:2 withValue:drawable.height * 0.5f];
    }
	
    // rotate axis
    if (nargs >= 6) {
        SQFloat f;
        sq_getfloat(v, 6, &f);
        [drawable setRotate:3 withValue:f];
    } else {
        [drawable setRotate:3 withValue:AXIS_Z];
    }
	
    return 0;
}

/*
 * set color of the drawable
 */
SQInteger emoDrawableColor(HSQUIRRELVM v) {
    const SQChar* id;
    SQInteger nargs = sq_gettop(v);
    if (nargs >= 2 && sq_gettype(v, 2) == OT_STRING) {
        sq_tostring(v, 2);
        sq_getstring(v, -1, &id);
        sq_poptop(v);
    } else {
        sq_pushinteger(v, ERR_INVALID_PARAM);
        return 1;
    }
	
    EmoDrawable* drawable = [engine getDrawable:id];
	
    if (drawable == nil) {
        sq_pushinteger(v, ERR_INVALID_ID);
        return 1;
    }
	
    if (nargs >= 3) {
        SQFloat r;
        sq_getfloat(v, 3, &r);
        [drawable setColor:0 withValue:r];
    }
	
    if (nargs >= 4) {
        SQFloat g;
        sq_getfloat(v, 4, &g);
        [drawable setColor:1 withValue:g];
    }
	
    if (nargs >= 5) {
        SQFloat b;
        sq_getfloat(v, 5, &b);
        [drawable setColor:2 withValue:b];
    }
	
    if (nargs >= 6) {
        SQFloat a;
        sq_getfloat(v, 6, &a);
        [drawable setColor:3 withValue:a];
    }
	return 0;
}

/*
 * unload drawable
 */
SQInteger emoDrawableUnload(HSQUIRRELVM v) {
    const SQChar* id;
    SQInteger nargs = sq_gettop(v);
    if (nargs >= 2 && sq_gettype(v, 2) == OT_STRING) {
        sq_tostring(v, 2);
        sq_getstring(v, -1, &id);
        sq_poptop(v);
    } else {
        sq_pushinteger(v, ERR_INVALID_PARAM);
        return 1;
    }
	
    EmoDrawable* drawable = [engine getDrawable:id];
	
    if (drawable == nil) {
        sq_pushinteger(v, ERR_INVALID_ID);
        return 1;
    }
	
    if ([engine removeDrawable:id]) {
        sq_pushinteger(v, EMO_NO_ERROR);
    } else {
        sq_pushinteger(v, ERR_ASSET_UNLOAD);
    }
	
    return 1;
}

/*
 * set onDraw interval
 */
SQInteger emoSetOnDrawInterval(HSQUIRRELVM v) {
    SQInteger oldInterval = engine.onDrawDrawablesInterval;
	
    if (sq_gettype(v, 2) == OT_INTEGER) {
        SQInteger interval;
        sq_getinteger(v, 2, &interval);
        engine.onDrawDrawablesInterval = interval;
    }
    sq_pushinteger(v, oldInterval);
	
	return 1;
}