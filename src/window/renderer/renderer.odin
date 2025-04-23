package renderer

import "core:fmt"
import "vendor:glfw"

@(private) s_initialized := false
@(private) s_present_render_fn : proc()


setup :: proc(window_handle : glfw.WindowHandle, present_render_fn : proc()) {
    fmt.println("Setup renderer.")
    ensure(!s_initialized)

    if !setup_opengl_context_in_glfw(window_handle) {
        fmt.eprintln("  ERROR: Setting up OpenGL context failed. Aborting.")
        return
    }

    s_present_render_fn = present_render_fn

    s_initialized = true
}

teardown :: proc() {
    fmt.println("Teardown renderer.")
    ensure(s_initialized)

    s_initialized = false
}
