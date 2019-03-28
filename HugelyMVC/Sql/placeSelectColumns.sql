﻿p.id,
p.sectorId,
isnull(p.rcid,isnull( p.submarketid, p.msaid )) AS RentAndVacancyChartId,
p.sector,
p.msaId,
p.msa,
p.entitlementMsaId,
p.submarketId,
p.submarket,
p.point.Lat as Lat,
p.point.Long as Lng,
ps.shape.STAsText() as parcelShape,
p.propertyName,
p.streetAddress,
p.city,
p.state,
p.zip,
p.county,
p.parcelNumber,
p.imageHeading,
p.imagePitch,
p.imageZoom,
p.imageFov,
p.imageLatitude,
p.imageLongitude,
p.QualityScore,
p.PropertyTypeId,
p.propertyType,
{{ "p.yearBuilt" | EnforceEntitlement }},
{{ "p.yearRenovated" | EnforceEntitlement }},
{{ "p.floors" | EnforceEntitlement }},
{{ "p.buildings" | EnforceEntitlement }},
{{ "p.sizeSqft" | EnforceEntitlement }},
{{ "p.sizeUnit" | EnforceEntitlement }},
{{ "p.sizeBed" | EnforceEntitlement }},
{{ "p.sizeRoom" | EnforceEntitlement }},
{{ "p.SizeRvBoatParking" | EnforceEntitlement }},
{{ "p.SizeClimateControlled" | EnforceEntitlement }},
{{ "p.SizeNonClimateControlled" | EnforceEntitlement }},
{{ "p.grossLeasableArea"  | EnforceEntitlement }},
{{ "p.buildingClass" | EnforceEntitlement }},
{{ "p.taxYear" | EnforceEntitlement }},
{{ "p.taxAmount" | EnforceEntitlement }},
{{ "p.salePrice" | EnforceEntitlement }},
{{ "p.salePricePSF" | EnforceEntitlement }},
{{ "p.salePricePerUnit" | EnforceEntitlement }},
{{ "p.vacancy" | EnforceEntitlement }},
{{ "p.rentPSF" | EnforceEntitlement }},
{{ "p.rentPerUnit" | EnforceEntitlement }},
{{ "p.effRentPSF" | EnforceEntitlement }},
{{ "p.effRentPerUnit" | EnforceEntitlement }},
{{ "p.saleDateJulian" | EnforceEntitlement }},
{{ "p.zoning" | EnforceEntitlement }},
{{ "p.capRate" | EnforceEntitlement }},
{{ "p.metroCapRate" | EnforceEntitlement }},
{{ "p.assessedYear" | EnforceEntitlement }},
{{ "p.assessedValue" | EnforceEntitlement }},
{{ "p.assessedLandValue" | EnforceEntitlement }},
{{ "p.appraisedValue" | EnforceEntitlement }},
{{ "p.appraisedLandValue" | EnforceEntitlement }},
{{ "p.rentchange" | EnforceEntitlement }},
{{ "p.vacancychange" | EnforceEntitlement }},
{{ "p.prevquarteryear" | EnforceEntitlement }},
{{ "p.prevquarterquarter" | EnforceEntitlement }},
{{ "p.constructionStatus" | EnforceEntitlement }},
{{ "p.expectedCompletionDateJulian" | EnforceEntitlement }},

{{ "p.ScRecordType" | EnforceEntitlement }},
{{ "p.deedreference" | EnforceEntitlement }},
{{ "p.pctinterestpurchased" | EnforceEntitlement }},
{{ "p.estimatedGoingInCapRate" | EnforceEntitlement }},

{{ "p.SizeLihtcUnits " | EnforceEntitlement }},
{{ "p.SizeMarketRateUnits" | EnforceEntitlement }},
{{ "p.SizeSection8Units" | EnforceEntitlement }},
{{ "p.SizeOtherUnits" | EnforceEntitlement }},

{{ "p.rentClimateControlled" | EnforceEntitlement }},
{{ "p.rentNonClimateControlled" | EnforceEntitlement }},

{{ "p.SizeLotSqft" | EnforceEntitlement }},
{{ "p.SizeLotAcre" | EnforceEntitlement }},

{{ "p.PrimaryCareType" | EnforceEntitlement }},

{{ "p.BuyerSellerRelationship" | EnforceEntitlement }},



{{ "p.loanLender" | EnforceEntitlement }},
{{ "p.loanAmount" | EnforceEntitlement }},
{{ "p.loanType" | EnforceEntitlement }},
{{ "p.loanTerm" | EnforceEntitlement }},


{{ "p.ceilingheight" | EnforceEntitlement }},
{{ "p.numloadingdocks" | EnforceEntitlement }},
{{ "p.hasdriveindoors" | EnforceEntitlement }},
{{ "p.numdriveindoors" | EnforceEntitlement }},
{{ "p.hasraildoors" | EnforceEntitlement }},
{{ "p.numraildoors" | EnforceEntitlement }},

{{ "p.isOpportunityZone" | EnforceEntitlement }},
{{ "p.spaces" | EnforceEntitlement }},
{{ "p.CensusTract" | EnforceEntitlement }},

{{ "rc.anchorSize" | EnforceEntitlement }},
{{ "rc.nonAnchorSize" | EnforceEntitlement }},
{{ "rc.unitdesignations" | EnforceEntitlement }},
{{ "rc.sectioneightstartJulian" | EnforceEntitlement }},
{{ "rc.sectioneightendJulian" | EnforceEntitlement }},
{{ "rc.taxremaining" | EnforceEntitlement }},
{{ "rc.waitlist" | EnforceEntitlement }},
{{ "rc.waitlistlength" | EnforceEntitlement }},
{{ "rc.minincome" | EnforceEntitlement }},
{{ "rc.maxincome" | EnforceEntitlement }},
{{ "rc.heatsource" | EnforceEntitlement }},
{{ "rc.payment_type" | EnforceEntitlement }}, 


{{ "sc.subsidies" | EnforceEntitlement }},
{{ "sc.hudids" | EnforceEntitlement }},
{{ "sc.BLD_IMP_CD" | EnforceEntitlement }},
{{ "sc.LOC_INF" | EnforceEntitlement }},
{{ "sc.SEWER" | EnforceEntitlement }},
{{ "sc.WATER" | EnforceEntitlement }},

{{ "pc.owner" | EnforceEntitlement }},
{{ "pc.buyer" | EnforceEntitlement }},
{{ "pc.buyerPhone" | EnforceEntitlement }},
{{ "pc.seller" | EnforceEntitlement }},
{{ "pc.sellerPhone" | EnforceEntitlement }},
{{ "pc.buyerBroker" | EnforceEntitlement }},
{{ "pc.buyerBrokerPhone" | EnforceEntitlement }},
{{ "pc.sellerBroker" | EnforceEntitlement }},
{{ "pc.sellerBrokerPhone" | EnforceEntitlement }},
{{ "pc.managementCompany" | EnforceEntitlement }},
{{ "pc.managementCompanyPhone" | EnforceEntitlement }},
{{ "p.website" | EnforceEntitlement }},
{{ "pc.developer" | EnforceEntitlement }},
{{ "pc.developerPhone" | EnforceEntitlement }},
{{ "m.marketVacancy" | EnforceEntitlement }},
{{ "m.marketRent" | EnforceEntitlement }},
{{ "m.marketRentChange" | EnforceEntitlement }},
{{ "m.marketInventorySf" | EnforceEntitlement }},
{{ "m.marketInventoryUnit" | EnforceEntitlement }},
{{ "m.marketCompletions" | EnforceEntitlement }},
{{ "m.marketOccupiedStock" | EnforceEntitlement }},
{{ "m.marketEffRent" | EnforceEntitlement }},
{{ "m.marketEffRentChange" | EnforceEntitlement }},
{{ "s.submarketVacancy" | EnforceEntitlement }},
{{ "s.submarketRent" | EnforceEntitlement }},
{{ "s.submarketRentChange" | EnforceEntitlement }},
{{ "s.submarketInventorySf" | EnforceEntitlement }},
{{ "s.submarketInventoryUnit" | EnforceEntitlement }},
{{ "s.submarketCompletions" | EnforceEntitlement }},
{{ "s.submarketOccupiedStock" | EnforceEntitlement }},
{{ "s.submarketEffRent" | EnforceEntitlement }},
{{ "s.submarketEffRentChange" | EnforceEntitlement }},
{{ "eb.story" | EnforceEntitlement }},
CASE WHEN
	e.msaid IS NOT NULL THEN 1
	ELSE 0
END AS isEntitled