package src

import "core:fmt"
import "core:time"
import "game_engine"
import "window"
import "window/renderer"


main :: proc() {
    // Program boundary messages.
    fmt.println("Start of program.")
    defer fmt.println("End of program.")

    // Create window.
    window.setup()
    defer window.teardown()

    // Create game engine.
    game_engine.setup(window.poll_events)
    defer game_engine.teardown()

    // Create renderer.
    renderer.setup(window.get_window_handle(), window.present_render)
    defer renderer.teardown()

    {   // Main loop.
        fmt.println(      "-=-=-=-= Start of Main Loop =-=-=-=-")
        defer fmt.println("-=-=-=-=  End of Main Loop  =-=-=-=-")

        for is_running() {
            game_engine.let_tick()
            renderer.let_render()
        }
    }
}


@(private)
is_running :: proc() -> bool {
    return game_engine.is_running() && window.is_running()
}
