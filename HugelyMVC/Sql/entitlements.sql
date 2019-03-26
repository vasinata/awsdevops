SELECT DISTINCT MSAID
FROM 
	hugelySeldom.dbo.entitlements_flat
WHERE
	{% if companyId > 0 %}
	corporateid = @companyId
	AND
	{% endif %}
	reporttemplateid = @reportTemplateId