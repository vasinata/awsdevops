SELECT
	id,
	placetype,
	displaytext,
	searchText,
	shape,
	envelope.STPointN(1).STX as west,
	envelope.STPointN(1).STY as south,
	envelope.STPointN(3).STX as east,
	envelope.STPointN(3).STY as north,
	NULL AS latitude,
	NULL AS longitude,
	sectorID 
FROM (
	SELECT
		ps.id,
		placetype,
		displaytext,
		searchText,
		shape.STAsText() shape,
		geometry::STGeomFromWKB(shape.STAsBinary(), shape.STSrid).STEnvelope() AS envelope,
		ps.sectorID 
	FROM
		placesuggestion ps
		INNER JOIN allReisShapes ars ON ps.ID = ars.id
	WHERE
		ars.shape.STIntersects( geography::Point( @Lat, @Lng, 4326 ))= 1
		AND
		placetype = 'zip'
) AS PlaceSuggestion