package game_engine

import "core:time"


@(private) s_prev_tick          : time.Tick
@(private) s_accum_sim_time     : time.Duration = 0
@(private) s_max_lap_time       : time.Duration : time.Second / 4
@(private) s_ticks_per_second   :               : 60
@(private) s_fixed_delta_time   : time.Duration : time.Second / s_ticks_per_second
@(private) s_fixed_delta_time_d : f32           : 1.0 / f32(s_ticks_per_second)


let_tick :: proc() {
    assert(s_initialized)

    // Increment delta time until should run a simulation tick.
    s_accum_sim_time += min(s_max_lap_time,
                            time.tick_lap_time(&s_prev_tick))
    
    for s_accum_sim_time >= s_fixed_delta_time {
        tick(s_fixed_delta_time_d)
        s_accum_sim_time -= s_fixed_delta_time
    }
}

get_render_state :: proc() {
    assert(s_initialized)

    // Calculate interpolation alpha.
    alpha := f32(s_accum_sim_time) / f32(s_fixed_delta_time)

    // @TODO: Big sweeping update of all the objects the renderer wants in a batch.
}
