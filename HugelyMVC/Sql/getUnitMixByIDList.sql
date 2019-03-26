SELECT
	m.LABEL,
	m.UNITS,
	m.AVGSF,
	m.LOWRENT,
	m.HIGHRENT,
	m.AVGRENT,
	m.EFFRENTPSF,
	m.AVGRENTPSF,
	m.SIZEPCT,
	m.INCREASEPCT,
	m.SCHEDULEDINCREASE,
	m.SORDER,
	m.ID AS rcid,
	p.id
from 
	place p
	inner join mix m on m.ID = p.rcid
WHERE
	(
	0 = 1
    {% for aId in Ids %}
		or p.id = @ids{{ forloop.index }}
    {% endfor %}
	)
order by sorder;
