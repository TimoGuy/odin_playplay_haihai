package game_engine

import "core:time"


@(private) s_prev_tick                 : time.Tick
@(private) s_accum_sim_time            : time.Duration = 0
@(private) s_sim_time_for_one_timestep : time.Duration : time.Second / 60


let_tick :: proc() {
    assert(s_initialized)

    // Increment delta time until should run a simulation tick.
    s_accum_sim_time += time.tick_lap_time(&s_prev_tick)
    
    for s_accum_sim_time >= s_sim_time_for_one_timestep {
        s_poll_events_fn()
        tick(s_sim_time_for_one_timestep)
        s_accum_sim_time -= s_sim_time_for_one_timestep
    }
}

get_render_state :: proc() {
    assert(s_initialized)

    // Calculate interpolation alpha.
    alpha := f32(s_accum_sim_time) / f32(s_sim_time_for_one_timestep)

    // @TODO: Big sweeping update of all the objects the renderer wants in a batch.
}
