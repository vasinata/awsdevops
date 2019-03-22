SELECT
	id,
	shape.STAsText() shape
FROM zip
WHERE
	zip.shape.STIntersects( geography::Point( @Lat, @Lng, 4326 )) = 1
