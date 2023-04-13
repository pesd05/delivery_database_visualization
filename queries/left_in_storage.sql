SELECT
	s2.ing_name,
	s2.ordered_weight,
	st.quantity,
	st.quantity - s2.ordered_weight AS remaining_weight 
FROM
	( SELECT ing_id, ing_name, sum( ordered_weight ) AS ordered_weight FROM ingredients1 GROUP BY ing_name, ing_id ) s2
	LEFT JOIN `Storage` st ON s2.ing_id = st.ing_id
	LEFT JOIN Ingredients ing ON s2.ing_id = ing.ing_id
