select
    item_code,
    shop_id,
from {{ source('tmp_dbt_osmosis_test', 'raw_item_shops') }}