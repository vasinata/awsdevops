SELECT
	rvt.year,
	rvt.proprent,
	rvt.propvac,
	rvt.msarent,
	rvt.msavac,
	rvt.subrent,
	rvt.subvac,
	rvt.regionrent,
	rvt.regionvac,
	rvt.msaid,
	rvt.id,
	rvt.subname,
	rvt.msaname,
	rvt.regionname
FROM
	rentvactrendsdisplay rvt  
WHERE
	(rvt.msaid IS NULL AND rvt.id = @rentAndVacancyChartId)
	OR
	(rvt.id IS NULL AND rvt.msaid = @rentAndVacancyChartId)
ORDER BY year