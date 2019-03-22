WITH ENTITLEMENTS AS(
	{{entitlementsSql}}
)
SELECT
    {{placeSelectColumnsSql}}
FROM 
    place p
    {{placeFromTablesSql}}
WHERE
    0 = 1
    {% for aId in Ids %}
		or p.id = @ids{{ forloop.index }}
    {% endfor %}
ORDER BY
QualityScore DESC,
p.id