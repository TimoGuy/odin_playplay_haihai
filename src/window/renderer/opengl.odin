package renderer

import "core:fmt"
import "core:time"
import "vendor:glfw"
import gl "vendor:OpenGL"


GL_MAJOR_VERSION :: 4
GL_MINOR_VERSION :: 6


@(private)
setup_opengl_context_in_glfw :: proc(window_handle : glfw.WindowHandle) -> bool {
    fmt.println("  Setup OpenGL w glfw context.")

    ensure(window_handle != nil)
    glfw.MakeContextCurrent(window_handle)
    gl.load_up_to(GL_MAJOR_VERSION,
                  GL_MINOR_VERSION,
                  glfw.gl_set_proc_address)

    return true
}

// Called by `timing.odin`
@(private)
render_opengl :: proc(delta_time : time.Duration) {
    gl.ClearColor(0.5, 1.0, 0.75, 1.0)
    gl.Clear(gl.COLOR_BUFFER_BIT)
}
