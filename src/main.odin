package src

import "core:time"
import "window"

ONE_MS :: 1_000_000


main :: proc()
{
    // Setup window.
    window.setup()
    defer window.teardown()

    time.sleep(1000 * ONE_MS)
}
