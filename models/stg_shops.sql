select
    shop_id,
    item_key,
from {{ source('tmp_dbt_osmosis_test', 'raw_shops') }}