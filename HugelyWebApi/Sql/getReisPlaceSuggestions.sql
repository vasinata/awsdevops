SELECT
    TOP 10
    id,
    placetype,
    displaytext
FROM placesuggestion
WHERE 
	searchText like '{{input}}%'
ORDER BY
	CASE placetype
		WHEN 'submarket' THEN 0
		WHEN 'market' THEN 1
		WHEN 'zip' THEN 2
		WHEN 'county' THEN 3
		WHEN 'address' THEN 4
		ELSE 5
	END,
	displaytext