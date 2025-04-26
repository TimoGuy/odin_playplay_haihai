package renderer

import "core:time"


@(private) s_prev_tick : time.Tick


let_render :: proc() {
    assert(s_initialized)
    
    should_render := true
    
    if should_render {
        // @THOUGHT: If the gameobjects are just gonna be in line w the simulation
        //   game engine objects, then would the deltatime not be necessary to keep
        //   track of? Ig what I think atm is that for ui elements and stuff like that
        //   it'd be necessary and good to keep track for.  -Thea 2025/04/26
        delta_time_since_last_render := time.tick_lap_time(&s_prev_tick)
        render_opengl(f32(time.duration_seconds(delta_time_since_last_render)))
        s_present_render_fn()
    }
}
