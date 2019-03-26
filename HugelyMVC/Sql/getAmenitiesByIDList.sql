SELECT
	p.Id,
	amenityLevelDescription AS amenitiesDescription,
	amenities
from 
	place p
	inner join placeamenity pa on pa.ID = p.id 
WHERE
	(
	0 = 1
    {% for aId in Ids %}
		or p.id = @ids{{ forloop.index }}
    {% endfor %}
	)
