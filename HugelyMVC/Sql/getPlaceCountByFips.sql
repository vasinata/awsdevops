SELECT
	SUM(numplaces) AS numplaces,
	fips,
	countyName as fipsLabel
FROM
	countyCountsT
WHERE
	state = '{{ State }}'
	AND
	(
	0 = 1
    {% for aSectorId in SectorIds %}
		or sectorid = @sectorids{{ forloop.index }}
    {% endfor %}
	)
GROUP BY fips,countyName
ORDER BY
	fips;