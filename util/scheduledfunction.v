module util

import time

const (
	no_duration = time.Duration(0)
)

// ScheduledFn is a function that can be scheduled in the future
// with schedule_function
// it should return the duration between its current running
// and the next time it wants to be run (or no_duration) for none
pub type ScheduledFn = fn (ctx voidptr) time.Duration

struct ScheduledFunctionInside {
	delay time.Duration
	f     ScheduledFn
}

fn scheduled_function_runner(f ScheduledFn, ctx voidptr, d time.Duration) {
	time.sleep(d.milliseconds())
	for {
		new_delay := f(ctx)
		if new_delay == no_duration {
			break
		}
		time.sleep_ms(new_delay.milliseconds())
	}
}

pub fn schedule_function(f ScheduledFn, ctx voidptr, delay time.Duration) {
	go scheduled_function_runner(f, ctx, delay)
}
