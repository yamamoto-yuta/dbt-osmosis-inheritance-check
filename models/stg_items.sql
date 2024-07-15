select
    item_key,
    item_code,
from {{ source('tmp_dbt_osmosis_test', 'raw_items') }}