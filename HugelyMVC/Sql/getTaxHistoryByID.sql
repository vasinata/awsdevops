select
	year,
	tax,
	taxChange,
	CASE
		WHEN max(tax) OVER (ORDER BY year) IS NULL	THEN 0
		ELSE 1
	END AS hasTax,
	appraisedValue,
	appraisedValueChange,
	CASE
		WHEN max(appraisedValue) OVER (ORDER BY year) IS NULL	THEN 0
		ELSE 1
	END AS hasAppraisedValue,
	assesedValue,
	assesedValueChange,
	CASE
		WHEN max(assesedValue) OVER (ORDER BY year) IS NULL	THEN 0
		ELSE 1
	END AS hasAssesedValue
from
	placetax
where
	id = @id
ORDER BY year DESC
