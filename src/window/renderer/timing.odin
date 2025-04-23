package renderer


let_render :: proc() {
    ensure(s_initialized)

    should_render := true

    if should_render {
        render_opengl()
        s_present_render_fn()
    }
}
