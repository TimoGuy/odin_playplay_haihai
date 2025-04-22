package window

import "core:fmt"
import "vendor:glfw"
import gl "vendor:OpenGL"

s_window_handle : glfw.WindowHandle

WIDTH  :: 800
HEIGHT :: 450
TITLE  :: "Trying out GLFW in Odin"

GL_MAJOR_VERSION :: 4
GL_MINOR_VERSION :: 6


setup :: proc()
{
    if !bool(glfw.Init())
    {
        fmt.eprintln("GLFW failed to init. Aborting.")
        return
    }

    setup_glfw_window_hints()

    s_window_handle = glfw.CreateWindow(WIDTH, HEIGHT, TITLE, nil, nil)
    if s_window_handle == nil
    {
        fmt.eprintln("GLFW window creation failed. Aborting.")
        return
    }

    // Load OpenGL.
    glfw.MakeContextCurrent(s_window_handle)
    gl.load_up_to(GL_MAJOR_VERSION, GL_MINOR_VERSION, glfw.gl_set_proc_address)

}

teardown :: proc()
{
    glfw.DestroyWindow(s_window_handle)
    glfw.Terminate()
}


@(private)
setup_glfw_window_hints :: proc()
{
    xpos, ypos, width, height :=
        glfw.GetMonitorWorkarea(glfw.GetPrimaryMonitor())

    centered_window_pos : [2]i32 = {
        xpos + (0.5 * width - 0.5 * WIDTH),
        ypos +
            static_cast<int32_t>(height * 0.5
                - HEIGHT * 0.5),
    }

    glfw.WindowHint(GLFW_POSITION_X, centered_window_pos[0])
    glfw.WindowHint(GLFW_POSITION_Y, centered_window_pos[1])
    glfw.WindowHint(GLFW_CLIENT_API, GLFW_NO_API)
    glfw.WindowHint(GLFW_RESIZABLE, GLFW_FALSE)
}
