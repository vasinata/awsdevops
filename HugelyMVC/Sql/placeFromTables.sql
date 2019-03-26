LEFT JOIN placecontacts pc on p.id = pc.id
LEFT JOIN hugelySeldom.dbo.parcelShape ps ON p.parcelId = ps.id
LEFT JOIN ENTITLEMENTS e on e.msaid = p.entitlementmsaid
LEFT JOIN RC_FLAT rc ON p.rcid = rc.ID
LEFT JOIN SC_FLAT sc ON p.scid = sc.SC_ID
LEFT JOIN ExecutiveBriefing eb ON eb.SubmarketId = isNull(p.submarketId,p.MsaId)
LEFT JOIN (
	SELECT
		submarketId,
		t.vacPercent as marketVacancy,
		MARKETRENTDOLLARS as marketRent,
		t.marketRentPctChange as marketRentChange,
		inventorySf as marketInventorySf,
		inventoryUnits as marketInventoryUnit,
		COMPLETIONS as marketCompletions,
		OCCUPIEDSTOCK as marketOccupiedStock,
		EFFRENTDOLLARS as marketEffRent,
		t.EFFRENTPCHANGE as marketEffRentChange
	FROM
		currenttrends t
) m ON m.submarketId = p.msaId
LEFT JOIN (
	SELECT
		submarketId,
		t.vacPercent as submarketVacancy,
		MARKETRENTDOLLARS as submarketRent,
		t.marketRentPctChange as submarketRentChange,
		inventorySf as submarketInventorySf,
		inventoryUnits as submarketInventoryUnit,
		COMPLETIONS as submarketCompletions,
		OCCUPIEDSTOCK as submarketOccupiedStock,
		EFFRENTDOLLARS as submarketEffRent,
		t.EFFRENTPCHANGE as submarketEffRentChange
	FROM
		currenttrends t
) s ON s.submarketId = p.submarketId



