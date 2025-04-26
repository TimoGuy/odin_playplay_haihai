package game_engine

import "core:fmt"
import "core:time"

@(private) s_initialized := false
@(private) s_poll_events_fn : proc()


setup :: proc(poll_events_fn : proc()) {
    fmt.println("Setup game engine.")
    ensure(!s_initialized)

    s_poll_events_fn = poll_events_fn

    s_initialized = true
}

teardown :: proc() {
    fmt.println("Teardown game engine.")
    ensure(s_initialized)

    s_initialized = false
}

is_running :: proc() -> bool {
    assert(s_initialized)
    return true
}


// Called by `timing.odin`
@(private)
tick :: proc(delta_time : f32) {
    s_poll_events_fn()
    fmt.println("Tick!", delta_time)
}
