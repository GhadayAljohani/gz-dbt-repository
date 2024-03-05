SELECT 
     products_id,
     date_date,
     orders_id,
     revenue,
     quantity,
     CAST(purchase_price AS FLOAT64) AS price,
     ROUND(s.quantity*CAST(p.purchase_price AS FLOAT64),2) AS purchase_cost,
     s.revenue - ROUND(s.quantity*CAST(purchase_price AS FLOAT64),2) AS margin 
FROM {{ref("stg_raw__sales")}} s 
LEFT JOUN {{ref("stg_raw__product")}} p 
    USING (products_id)


