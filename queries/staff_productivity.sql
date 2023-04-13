SELECT
	sch.sch_date,
	st.staff_firstname,
	st.staff_lastname,
	st.staff_hourly_rate,
	sh.start_time,
	sh.end_time,
	((
			HOUR (
			TIMEDIFF( sh.end_time, sh.start_time ))* 60 
			)+(
			MINUTE (
			TIMEDIFF( sh.end_time, sh.start_time ))))/ 60 AS shift_length,
	((
			HOUR (
			TIMEDIFF( sh.end_time, sh.start_time ))* 60 
			)+(
			MINUTE (
			TIMEDIFF( sh.end_time, sh.start_time ))))/ 60 * st.staff_hourly_rate AS staff_salary 
FROM
	`Schedule` sch
	LEFT JOIN Staff st ON sch.staff_id = st.staff_id
	LEFT JOIN Shift sh ON sch.shift_id = sh.shift_id
