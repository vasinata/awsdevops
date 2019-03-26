SELECT
	ac.sc_id,
	name,
	location,
	contactLabel AS type,
	phone
FROM
	place p
    inner join salesOrder so on p.scid = so.scid
	inner join sc_allcontacts ac on ac.sc_id = so.priorscid
WHERE
	(
	0 = 1
    {% for aId in Ids %}
		or p.id = @ids{{ forloop.index }}
    {% endfor %}
	)