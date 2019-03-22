select
	DISTINCT
	mm.numsubmarkets,
	mm.numsubmarketszion,
	mm.numsubmarketsmsa,
	mm.compositescorenationalrank,
	mm.compositescorezionsrank,
	mm.compositescoremsarank,
	mm.compositescorenationalpercentile,
	mm.compositescorezionspercentile,
	mm.compositescoremsapercentile,
	mm.compositescore,
	mm.msaname,
	mm.submarketname,
	mm.submarketid,
	mm.msaid,
	
	
	mm.EffectiveRentGrowth1Year,
	mm.EffectiveRentGrowth1YearRank,
	mm.EffectiveRentGrowth1YearPercentile,
	mm.EffectiveRentGrowth1YearDateLabel,
    
	mm.Vacancy,
	mm.VacancyRank,
	mm.VacancyPercentile,
	mm.VacancyDateLabel,
    
	mm.InventoryGrowth2Year,
	mm.InventoryGrowth2YearRank,
	mm.InventoryGrowth2YearPercentile,
	mm.InventoryGrowth2YearDateLabel,
	
	mm.ValueChangeStDev3Year,
	mm.ValueChangeStDev3YearRank,
    mm.ValueChangeStDev3YearPercentile,
	mm.ValueChangeStDev3YearDateLabel,
	
	mm.EffectiveRevenueGrowth2Year,
	mm.EffectiveRevenueGrowth2YearRank,
	mm.EffectiveRevenueGrowth2YearPercentile,
    mm.EffectiveRevenueGrowth2YearDateLabel
from
	MarketMonitor mm
	INNER JOIN place p ON p.submarketId = mm.submarketid
WHERE
	(
	0 = 1
    {% for aId in Ids %}
		or p.id = @ids{{ forloop.index }}
    {% endfor %}
	);