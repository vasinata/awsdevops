WITH ENTITLEMENTS AS(
	{{entitlementsSql}}
)
SELECT
	p.id,
	scf.SC_ID AS ScId,
	salesorder sorder,
	scf.SaleDateJulian,
	scf.SALE_PRICE,
	scf.VACANCY_AT_TIME_OF_SALE,
	scf.CMNTS_SALE_DETAIL,
	scf.CMNTS_FINANCING_DETAIL,
	scf.PRICE_PER_UNIT_OF_MEASURE,
	scf.pricePerSqft,
	scf.pricePerUnit,
	scf.status as ScRecordType,

	{{ "NRASF" | EnforceEntitlement }},
	{{ "NRAUnit" | EnforceEntitlement }},
	{{ "POTENTIALREVENUE" | EnforceEntitlement }},
	{{ "VACANCYLOSS" | EnforceEntitlement }},
	{{ "VACANCYRATE" | EnforceEntitlement }},
	EFFECT_RENT_REV AS EffectRentRev,
	{{ "TOTALEXPENSES" | EnforceEntitlement }},
	TOTALEXPENSES_FT AS TotalExpensesFt,
	EXP_REIMBURSE AS ExpReimburse,
	EXP_REIMBURSE_FT AS ExpReimburseFt,
	{{ "FREERENT" | EnforceEntitlement }},
	FREERENT_FT AS FreeRentFt,
	FREERENT_UNIT AS FreeRentUnit,
	{{ "CREDITLOSS" | EnforceEntitlement }},
	CREDIT_LOSS_PCT AS CreditLossPct,
	ADD_INCOME AS AddIncome,
	ADD_INCOME_FT AS AddIncomeFt,
	ADD_INCOME_UNIT AS AddIncomeUnit,
	{{ "GROSSREVENUE" | EnforceEntitlement }},
	{{ "CAPEX" | EnforceEntitlement }},
	CAPEX_FT AS CapexFt,
	CAPEX_UNIT AS CapexUnit,
	{{ "NETOPERATINGINCOME" | EnforceEntitlement }},

	TA_CAPRATE AS TaCapRate,
	RPT_CAP_RATE  AS RptCapRate,
	SALE_DATE_YEAR as SaleDateYear,
	SALE_DATE_QUARTER as SaleDateQuarter,
	totalexpenses_ratio AS totalExpensesRatio,
	HAS_CAPRATE as HasCapRate,



	'-999' AS DocNumber,
	CASE
		WHEN IS_ARMS_LENGTH_TRANSACTION = 1 THEN 'Arm''s Length'
		WHEN IS_ARMS_LENGTH_TRANSACTION = 0 THEN 'Non-Arm''s Length'
	END  AS buyersellerrelationship,
	{{ "SCF.deed_reference" | EnforceEntitlement }},
	{{ "SCF.PCT_INTEREST_PURCHASED" | EnforceEntitlement }},
	{{ "SCF.goingincaprate" | EnforceEntitlement }},



	story
FROM
	place p
    INNER JOIN salesOrder so on p.scid = so.scid
    INNER JOIN sc_flat SCF ON SCF.SC_ID = so.priorscid
	LEFT JOIN marketattimeofsale mtos on mtos.scid = so.priorscid
	LEFT JOIN ENTITLEMENTS e on e.msaid = p.entitlementmsaid
WHERE
	(
	0 = 1
    {% for aId in Ids %}
		or p.id = @ids{{ forloop.index }}
    {% endfor %}
	)
	and
	p.scid is not null
ORDER BY scf.SC_ID,salesorder