SELECT
	tap.id,
	year(tap.saleDate) year,
	tap.saleprice,
	tap.priceperunitofmeasure,
	CASE tap.unitofmeasure
		WHEN 'sqft' THEN 'Per Square Foot'
		WHEN 'unit' THEN 'Per Unit'
	END AS unitofmeasure,
	tap.caprate as caprate,
	streetAddress
FROM
	taplace tap
	INNER JOIN place p on p.id = tap.id
WHERE tap.msaid = @msaId
ORDER BY  year(tap.saleDate), tap.priceperunitofmeasure;
