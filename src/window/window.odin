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
