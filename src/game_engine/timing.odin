package game_engine


let_tick :: proc() {
    ensure(s_initialized)

    should_tick := true

    if should_tick {
        s_poll_events_fn()
        tick()
    }
}
