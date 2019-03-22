SELECT
	TOP 1
	id,
	isParcelIntersect,
	isNearestNeighbor
FROM (
	SELECT
		TOP 1
		place.id,
		1 isParcelIntersect,
		0 isNearestNeighbor
	FROM
		PLACE
		INNER JOIN hugelySeldom.dbo.parcelShape parcel ON PLACE.parcelId = parcel.id
	WHERE
		PARCEL.shape.STIntersects( geography::Point( @Lat, @Lng, 4326 )) = 1
	ORDER BY
		qualityScore DESC

	UNION

	SELECT
		TOP 1
		place.id,
		0 isParcelIntersect,
		1 isNearestNeighbor
	FROM
		PLACE
	WHERE
		point.STDistance(geography::Point( @Lat, @Lng, 4326 )) < 250
	ORDER BY
		point.STDistance(geography::Point( @Lat, @Lng, 4326 ))
) ALLPLACES
ORDER BY isParcelIntersect DESC;