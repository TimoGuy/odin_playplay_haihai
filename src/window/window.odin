package window

import "core:fmt"
import "core:math"
import "vendor:glfw"


@(private) s_initialized := false
@(private) s_window_handle : glfw.WindowHandle

WIDTH  :: 800
HEIGHT :: 450
TITLE  :: "Trying out GLFW in Odin"


setup :: proc() {
    fmt.println("Setup window.")
    ensure(!s_initialized)

    if !bool(glfw.Init()) {
        fmt.eprintln("GLFW failed to init. Aborting.")
        return
    }

    setup_glfw_window_hints()

    s_window_handle = glfw.CreateWindow(WIDTH, HEIGHT, TITLE, nil, nil)
    if s_window_handle == nil {
        fmt.eprintln("GLFW window creation failed. Aborting.")
        return
    }

    s_initialized = true
}

teardown :: proc() {
    fmt.println("Teardown window.")
    ensure(s_initialized)

    glfw.DestroyWindow(s_window_handle)
    glfw.Terminate()

    s_initialized = false
}

is_running :: proc() -> bool {
    assert(s_initialized)
    return !glfw.WindowShouldClose(s_window_handle)
}

get_window_handle :: proc() -> glfw.WindowHandle {
    ensure(s_initialized)
    return s_window_handle
}

poll_events :: proc() {
    glfw.PollEvents()
}

present_render :: proc() {
    glfw.SwapBuffers(s_window_handle)
}


@(private)
setup_glfw_window_hints :: proc() {
    xpos, ypos, width, height : i32 =
        glfw.GetMonitorWorkarea(glfw.GetPrimaryMonitor())

    centered_window_pos : [2]i32 = {
        xpos + i32(math.floor(f32(width) * 0.5 - f32(WIDTH) * 0.5)),
        ypos + i32(math.floor(f32(height) * 0.5 - f32(HEIGHT) * 0.5)),
    }

    glfw.WindowHint(glfw.POSITION_X, centered_window_pos[0])
    glfw.WindowHint(glfw.POSITION_Y, centered_window_pos[1])
    glfw.WindowHint(glfw.RESIZABLE, glfw.FALSE)
}
