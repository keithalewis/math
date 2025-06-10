---
title: chrono
author: Keith A. Lewis
---

C++ `<chrono>` library.

A _duration_ is a duration of time represented by an arithmetic type and a compile-time fraction
indicating the number of seconds between each integral value in the representation.

A _time point_ is a _clock_ and a duration measuring time since the clock _epoch_.

A _date_ is a time point with precision of 1 day.

The class `year_month_day` does year and month calculations.
The class `sys_days` is a `time_point<system_clock, day>` for day oriented calculations.
Conversion between them is implicit with no loss of information.

The class `year_month_last` is last day of year and month.

The class `year_month_weekday` is $n$-th weekday of year and month.
Note 0-th weekday is last weekday of previous month.
Same as `weekday[last]` of previous month.

The class `system_clock` is Unix time -- time in seconds since 1970/January/1 00:00:00 UTC
excluding leap seconds. The class `sys_days` is `system_clock<days>`.

Use `zoned_time(const time_zone*, sys_time<Duration>)` to convert timepoint to time zone.
Duration must be at least seconds precision.
