SELECT
    date('now') as today,
    products.id AS ID,
    products.name AS name,
    product_types.name AS type,
    products.launch_date AS launch_date,
    products.review_date AS review_date,
    case
        when unpublish_date then 'False'
        when unpublish_date is NULL then 'True'
    end AS published
    
FROM products

JOIN product_types ON  products.type_id = product_types.id