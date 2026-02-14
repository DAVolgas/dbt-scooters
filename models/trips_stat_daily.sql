select 	
	started_at::date as date,
	count(*) as trips,
	MAX(price) as max_price_rub,
	AVG(distance) as avg_distance_km
from scooters_raw.trips
group by 1
order by 1