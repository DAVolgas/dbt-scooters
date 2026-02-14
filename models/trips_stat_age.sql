select 
	age,
	avg(trips) as avg_trips
from (
	select 
		t.started_at::date as date,
		extract('year' from t.started_at::date) - extract('year' from u.birth_date) as age,
		count(*) as trips
	from scooters_raw.trips t
	join scooters_raw.users u
		on t.user_id = u.id
	group by 1, 2
)
group by 1
order by 1