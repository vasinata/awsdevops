SELECT
	t.SC_ID AS SCID,
	t.NAME,
	t.PHASE,
	t.SECTOR,
	t.TENANT_SIZE,
	t.IS_GROUND_LEASE,
	t.IS_OWNED,
	t.IS_ANCHOR,
	t.IS_OUTPARCEL,
	t.TYPE
from
	place p
    inner join salesOrder so on p.scid = so.scid
	inner join sc_tenants t on t.sc_id = so.priorscid
WHERE
	(
	0 = 1
    {% for aId in Ids %}
		or p.id = @ids{{ forloop.index }}
    {% endfor %}
	)
