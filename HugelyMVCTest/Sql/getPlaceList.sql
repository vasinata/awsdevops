WITH ENTITLEMENTS AS(
	{{entitlementsSql}}
)

{% if customPolygonAsString != null %}
,
customPolygon AS(
	SELECT
		geography::STMPolyFromText(@customPolygonAsString, 4326) AS POLYGON
),
validCustomPolygon AS(
	SELECT
	CASE
		WHEN
			(SELECT POLYGON FROM customPolygon).STIsValid() = 1
		THEN
			 (SELECT POLYGON FROM customPolygon)
		ELSE
			(SELECT POLYGON.MakeValid() FROM customPolygon)
	END AS POLYGON
),
orientedValidCustomPolygon AS (
	SELECT
	CASE
		WHEN
			geography::STPointFromText('POINT(0 0)', 4326).STIntersects( (SELECT polygon FROM validCustomPolygon) ) = 1
		THEN
			 (SELECT polygon FROM validCustomPolygon).ReorientObject()
		ELSE
			(SELECT polygon FROM validCustomPolygon)
	END AS POLYGON
)
{% endif %}

SELECT *
FROM
	(
	{% if PlaceId != "" and PlaceId != null  %}
	SELECT {{placeSelectColumnsSql}}
	FROM
		place p
		{{placeFromTablesSql}}
	WHERE p.id = @PlaceId

	UNION ALL
	{% endif %}

	SELECT
		{{placeSelectColumnsSql}}
	FROM
		(
    
			SELECT TOP {{maxRecords}} id,state,qualityscore
			FROM
				placefilterable p
			WHERE
			(
				1 = 1

				------------------------------------
				--PlaceId
				{% if PlaceId != "" and PlaceId != null  %}
					and p.id <> @PlaceId
				{% endif %}


				------------------------------------
				--mapViewPortPolygon
				{% if mapViewPortPolygonAsString != null %}
					and p.point.STIntersects( geography::STPolyFromText(@mapViewPortPolygonAsString, 4326) )= 1
				{% endif %}

				------------------------------------
				--customPolygon
				{% if customPolygonAsString != null %}
					and 
					p.point.STIntersects( (SELECT POLYGON FROM orientedValidCustomPolygon) ) = 1
				{% endif %}
	
				------------------------------------
				--Sector
				{% if sectorIds.size > 0 %}
					and
					(
						1 = 0
						{% for aSectorId in sectorIds %}
							or p.sectorId = @sectorIds{{ forloop.index }}
						{% endfor %}
					)
				{% endif %}
	
				------------------------------------
				--SizeSqft
				{% if SizeType == "Sqft" %}
					{% if SizeSqftLow != null %}
					and p.SizeSqft > @SizeSqftLow
					{% endif %}
					{% if SizeSqftHigh != null %}
					and p.SizeSqft < @SizeSqftHigh
					{% endif %}
				{% endif %}

				------------------------------------
				--SizeUnit
				{% if SizeType == "Unit" %}
					{% if SizeUnitLow != null %}
					and p.SizeUnit > CAST(@SizeUnitLow AS int)
					{% endif %}
					{% if SizeUnitHigh != null %}
					and p.SizeUnit < CAST(@SizeUnitHigh AS int)
					{% endif %}
				{% endif %}

				------------------------------------
				--YearBuilt
				{% if YearBuiltLow != null %}
				and p.YearBuilt > @YearBuiltLow
				{% endif %}
				{% if YearBuiltHigh != null %}
				and p.YearBuilt < @YearBuiltHigh
				{% endif %}
	
				------------------------------------
				--RentPsf
				{% if SizeType == "Sqft" %}
					{% if RentPsfLow != null %}
					and p.RentPsf > @RentPsfLow
					{% endif %}
					{% if RentPsfHigh != null %}
					and p.RentPsf < @RentPsfHigh
					{% endif %}
				{% endif %}

				------------------------------------
				--RentPerUnit
				{% if SizeType == "Unit" %}
					{% if RentPerUnitLow != null %}
					and p.RentPerUnit > CAST(@RentPerUnitLow AS NUMERIC(10,2))
					{% endif %}
					{% if RentPerUnitHigh != null %}
					and p.RentPerUnit < CAST(@RentPerUnitHigh AS NUMERIC(10,2))
					{% endif %}
				{% endif %}

				------------------------------------
				--SalePrice
				{% if SalePriceLow != null %}
				and p.SalePrice > @SalePriceLow
				{% endif %}
				{% if SalePriceHigh != null %}
				and p.SalePrice < @SalePriceHigh
				{% endif %}
	
				------------------------------------
				--SaleDateJulian
				{% if SaleDateJulianLow != null %}
				and p.SaleDateJulian > @SaleDateJulianLow
				{% endif %}
				{% if SaleDateJulianHigh != null %}
				and p.SaleDateJulian < @SaleDateJulianHigh
				{% endif %}

				------------------------------------
				--contacts	
				{% if Contacts != null %}
				and p.Contacts LIKE '%' + @Contacts + '%'
				{% endif %}
			)
			order by qualityScore desc
		) pf
		INNER JOIN PLACE p on
		(
			p.id = pf.id
			AND
			p.qualityScore=pf.qualityscore
			AND
			p.state=pf.state	
		)
		{{placeFromTablesSql}}	
	) as pl
ORDER BY
	{% if PlaceId != "" and PlaceId != null  %}
		CASE WHEN pl.id = @PlaceId THEN 1 ELSE 0 END DESC,
	{% endif %}
	{% if PreferredSectorId != null %}
	CASE
		WHEN sectorId = @PreferredSectorId THEN 1
		ELSE 0
	END  DESC,
	{% endif %}
	qualityScore DESC,
	pl.id
