SELECT
        o.orders_id,
        o.date_date,
        ROUND(s,shipping_fee - (s.logcost + s.ship_cost),2) AS operational_margin,
        o.quantity,
        o.revenue,
        o.margin,
        s.shipping_fee,
        s.logcost,
        s.ship_cost
    FROM{{ref("int_orders_margin")}} o 
    LEFT JOIN {{ref("stg_raw__ship")}} s
    USING(orders_id)
    GROUP BY orders_id,date_date
    ORDER BY orders_id,date_date DESC