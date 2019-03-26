SELECT
	ID,
	shape.STAsText() as submarketShape
FROM submarket
WHERE
	ID = @SubmarketId