WITH cte AS
(
	SELECT * FROM bike_share_yr_0
	UNION ALL
	SELECT * FROM bike_share_yr_1
)
SELECT 
	cast(dteday as date)  as dteday,
	season,
	cte.yr,
	weekday,
	cast(hr as int) as hr,
	rider_type,
	cast(riders as int) as riders,
	cast(c.price as float) as price,
	cast(c.COGS as float) as COGS,
	cast(riders * c.price as float) as revenue,
	cast((riders * c.price)-c.COGS as float)as profit
FROM		cte
LEFT JOIN	cost_table c
ON			cte.yr = c.yr
