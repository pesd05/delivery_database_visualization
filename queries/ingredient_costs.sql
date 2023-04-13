SELECT
	s1.item_name,
	s1.ing_id,
	s1.ing_name,
	s1.order_quantity,
	s1.recipe_quantity,
	s1.order_quantity * s1.recipe_quantity AS ordered_weight,
	s1.ing_price / s1.ing_weight AS unit_price,
	( s1.order_quantity * s1.recipe_quantity )*(
		s1.ing_price / s1.ing_weight 
	) AS ingredient_cost 
FROM
	(
	SELECT
		o.item_id,
		m.recipe_id,
		m.item_name,
		r.ing_id,
		i.ing_name,
		r.quantity AS recipe_quantity,
		SUM( o.quantity ) AS order_quantity,
		i.ing_weight,
		i.ing_price 
	FROM
		Orders o
		LEFT JOIN Menu m ON o.item_id = m.item_id
		LEFT JOIN Recipe r ON m.recipe_id = r.recipe_id
		LEFT JOIN Ingredients i ON r.ing_id = i.ing_id 
	GROUP BY
		o.item_id,
		m.recipe_id,
		m.item_name,
		r.ing_id,
		i.ing_name,
		r.quantity,
		i.ing_weight,
	i.ing_price 
	) s1
