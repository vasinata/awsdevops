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
		LEFT JOIN allReisShapes ars ON ps.ID = ars.id
	WHERE ps.id = cast(@id as varchar(36))
) AS PlaceSuggestion