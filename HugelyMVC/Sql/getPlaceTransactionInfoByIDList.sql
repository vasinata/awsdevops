select
p.id,
p.qualityScore,
isnull( s.sector, p.sectorID ) as sector,
isnull( s.msa, 'US' ) as msa,
isnull( s.subid, 0 ) as subid
from
(
select 
	*
from
	place  
WHERE
    0 = 1
    {% for aId in ids %}
		or id = @ids{{ forloop.index }}
    {% endfor %}

) p
left join submarket s on
	s.id = p.msaID

