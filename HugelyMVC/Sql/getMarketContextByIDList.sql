SELECT
	p.id,story
FROM
	gabbyproperty gp
	INNER JOIN place p on p.rcid = gp.rcid
WHERE
	(
	0 = 1
    {% for aId in Ids %}
		or p.id = @ids{{ forloop.index }}
    {% endfor %}
	)
