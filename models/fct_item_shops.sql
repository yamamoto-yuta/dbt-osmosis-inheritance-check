WITH

-- import

items AS (
    SELECT
        item_key,
        item_code,
    FROM
        {{ ref('stg_items') }}
),

shops AS (
    SELECT
        shop_id,
        item_key,
    FROM
        {{ ref('stg_shops') }}
),

shop_items AS (
    SELECT
        item_code,
        shop_id,
    FROM
        {{ ref('stg_item_shops') }}
),

-- logical

base_data AS (
    SELECT
        C.item_key,
        A.item_code,
        A.shop_id,
    FROM
        shop_items A
        LEFT JOIN shops B USING (shop_id)
        LEFT JOIN items C USING (item_code)
),

final AS (
    SELECT * FROM base_data
    WHERE item_key IS NOT NULL
)

SELECT * FROM final