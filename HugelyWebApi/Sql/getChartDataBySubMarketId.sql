SELECT
*
FROM
yearendtrendsrollup
WHERE submarketid = @SubmarketId
ORDER BY subid DESC,ZOOM, sc, year
