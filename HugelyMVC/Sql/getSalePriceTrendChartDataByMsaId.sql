SELECT
	msaid,
	year,
	caprate AS caprate,
	numtransactions,
	volume,
	isforecast
FROM tarollup
WHERE msaid = @msaId
ORDER BY  year