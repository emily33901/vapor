module util

import time

// Scheduled allows a function to be run in the future
pub interface Scheduled {
	run() ?time.Duration
}

fn scheduled_function_runner(s Scheduled, d time.Duration) {
	time.sleep_ms(d.milliseconds())
	for {
		new_delay := s.run() or {
			// TODO This will swallow errors but that would
			// happen anyway with any `go` call
			// so I think its fine
			break
		}
		time.sleep_ms(new_delay.milliseconds())
	}
}

// schedule_function schedules a function to be run in the future
pub fn schedule_function(s Scheduled, delay time.Duration) {
	go scheduled_function_runner(s, delay)
}
