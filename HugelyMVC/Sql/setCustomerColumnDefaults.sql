DELETE FROM HugelySeldom.dbo.customerColumnDefaults WHERE customerID = @customerId

{% for aVisibleId in visibleIds %}
	INSERT INTO HugelySeldom.dbo.customerColumnDefaults(customerID,columnID)
	VALUES(@customerId,@visibleIds{{ forloop.index }});
{% endfor %}