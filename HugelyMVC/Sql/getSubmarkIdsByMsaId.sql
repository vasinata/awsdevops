SELECT
	name,
	id as submarketId
FROM
	submarket s
WHERE
	parentID = @msaId
	AND
	id <> @msaId
	AND
	shape IS NOT NULL
ORDER BY SUBID