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
	latitude,
	longitude,
	sectorID 
FROM (
	SELECT
		ps.id,
		placetype,
		displaytext,
		searchText,
		NULL AS shape,
		geometry::STGeomFromWKB(point.BufferWithTolerance(200, .5, 0).STAsBinary(), point.STSrid).STEnvelope() AS envelope,
		point.Lat as latitude,
		point.Long as longitude,
		ps.sectorID
	FROM
		placesuggestion ps
		LEFT JOIN place p ON ps.ID = p.id
	WHERE ps.id = cast(@id as varchar(36))
) AS T