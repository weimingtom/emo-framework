#include <EGL/egl.h>
#include <GLES/gl.h>

namespace emo {
    class Stage {
    public:
        Stage();
        ~Stage();
        bool onLoad();
        void onDrawFrame();
        bool dirty;

        int width;
        int height;
        int viewport_width;
        int viewport_height;
    protected:
        bool loaded;

        GLuint vbo[2];

        short  indices[4];
        float  positions[12];

    };
}