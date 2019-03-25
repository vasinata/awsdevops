SELECT
	SUM(numplaces) AS numplaces,
	'US' + stateFips as fips,
	state as fipsLabel
FROM
	countyCountsT
WHERE
	(
	0 = 1
    {% for aSectorId in SectorIds %}
		or sectorid = @sectorids{{ forloop.index }}
    {% endfor %}
	)
GROUP BY stateFips,state
ORDER BY
	state;