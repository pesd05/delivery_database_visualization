SELECT
	o.order_id,
	m.item_price,
	o.quantity,
	m.item_category,
	m.item_name,
	o.created_at,
	a.delivery_address,
	a.address_city,
	a.addres_zipcode,
	o.delivery 
FROM
	Orders o
	LEFT JOIN Menu m ON o.item_id = m.item_id
	LEFT JOIN Address a ON o.address_id = a.address_id
