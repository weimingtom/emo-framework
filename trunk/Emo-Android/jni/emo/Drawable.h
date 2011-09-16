// Copyright (c) 2011 emo-framework project
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
// 
// * Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
// * Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
// * Neither the name of the project nor the names of its contributors may be
//   used to endorse or promote products derived from this software without
//   specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS 
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
// OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
// OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
// EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// 
#ifndef EMO_DRAWABLE_H
#define EMO_DRAWABLE_H

#include <EGL/egl.h>
#include <GLES/gl.h>

#include <sys/timeb.h>
#include <string>
#include <hash_map>
#include <vector>
#include <squirrel.h>
#include "Image.h"
#include "Util.h"

namespace emo {
    class AnimationFrame {
    public:
        AnimationFrame();
        ~AnimationFrame();
        std::string name;
        int   start;
        int   count;
        int   loop;
        int32_t interval;

        int   currentLoopCount;
        int   currentCount;

        int32_t getLastOnAnimationDelta();
        timeb lastOnAnimationInterval;
        
        int getNextIndex(int frameCount, int currentIndex);

        bool isFinished();
    };

    typedef std::hash_map <std::string, emo::AnimationFrame *> animations_t;

    class Drawable {
    public:

        Drawable();
        virtual ~Drawable();

        std::string name;

        virtual void load();
        virtual void reload();
        virtual bool bindVertex();
        virtual void onDrawFrame();
        virtual void deleteBuffer(bool force, bool skipGL);
        void generateBuffers();

        virtual void setFrameCount(int count);
        int  getFrameCount();

        GLuint getCurrentBufferId();
        bool isCurrentTexBufferLoaded();
		bool isVisible();

        bool setFrameIndex(int index);
        bool forceSetFrameIndex(int index);
        int  getFrameIndex();

        void setTexture(Image* image);
        Image* getTexture();

        float getScaledWidth();
        float getScaledHeight();

        bool hasSheet;
        bool animating;
        bool loaded;
        bool hasTexture;
        bool hasBuffer;
        bool independent;
        bool needTexture;

        int border;
        int margin;

        float      x;
        float      y;
        float      z;

        int        width;
        int        height;
        int        frameWidth;
        int        frameHeight;

        float      param_rotate[4];
        float      param_scale[4];
        float      param_color[4];

        void addAnimation(AnimationFrame* animation);
        bool setAnimation(std::string name);
        AnimationFrame* getAnimation(std::string name);
        bool deleteAnimation(std::string name);
        bool isAnimationFinished();

        bool enableAnimation(bool enable);

        virtual void setChild(Drawable* child);
        virtual Drawable* getChild();

        /* 
         * virtual methods for MapDrawable
         */
        virtual void addRow(int rowdata[], int count){}
        virtual bool clearTiles() { return false; }
        virtual bool setTileAt(int row, int column, int value) { return false; }
        virtual int  getTileAt(int row, int column) { return -1; }
        virtual std::vector<int> getTileIndexAtCoord(float x, float y) { std::vector<int> p; return p; }
        virtual std::vector<float> getTilePositionAtCoord(float x, float y) { std::vector<float> p; return p; }

        float getTexCoordStartX();
        float getTexCoordEndX();
        float getTexCoordStartY();
        float getTexCoordEndY();

        float getTexelHalfX();
        float getTexelHalfY();

        bool useMesh;

        float orthFactorX;
        float orthFactorY;

        bool isScreenEntity;
    protected:

        float      vertex_tex_coords[8];

        int        frame_index;
        GLuint*    frames_vbos;
        int        frameCount;

        Image*     texture;
        Drawable*  child;

        int tex_coord_frame_startX();
        int tex_coord_frame_startY();

        bool frameCountLoaded;

        void deleteAnimations();
        animations_t* animations;

        bool frameIndexChanged;
        int  nextFrameIndex;

        std::string animationName;
        AnimationFrame* currentAnimation;
    };

    class MapDrawable : public Drawable {
    public:
        MapDrawable(Drawable* drawable);
        virtual ~MapDrawable();

        virtual void load();
        virtual void reload();
        virtual bool bindVertex();
        virtual void onDrawFrame();
        virtual void deleteBuffer(bool force, bool onTerm);

        virtual void setChild(Drawable* child);
        virtual Drawable* getChild();

        virtual void addRow(int rowdata[], int count);
        virtual bool clearTiles();
        virtual bool setTileAt(int row, int column, int value);
        virtual int  getTileAt(int row, int column);
        virtual std::vector<int> getTileIndexAtCoord(float x, float y);
        virtual std::vector<float> getTilePositionAtCoord(float x, float y);

        void createMeshPositionBuffer();
        void createMeshIndiceBuffer();
        void createMeshTextureBuffer();
        void unbindMeshVertex();

        int getMeshIndiceCount();
    protected:
        std::vector<std::vector<int>*>* tiles;
        Drawable* drawable;

        int columns;
        int rows;

        bool meshLoaded;
        short* meshIndices;
        float* meshPositions;
        float* meshTexCoords;
        GLuint mesh_vbos[3];
        int    meshIndiceCount;

        bool isInRange();
    };

    class LineDrawable : public Drawable {
    public:
        LineDrawable();
        virtual ~LineDrawable();

        virtual void setFrameCount(int count);
        virtual bool bindVertex();
        virtual void onDrawFrame();

        float   x2;
        float   y2;
    };

    class SnapshotDrawable : public Drawable {
    public:
        SnapshotDrawable();
        virtual ~SnapshotDrawable();

        virtual bool bindVertex();
        virtual void onDrawFrame();

    };
}
#endif
