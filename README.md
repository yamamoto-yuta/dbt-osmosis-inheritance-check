# dbt-osmosis-inheritance-check

Repository for verifying dbt-osmosis inheritance.

## Setup

1. Clone this repository and create a dbt environment.

```
git clone git@github.com:yamamoto-yuta/dbt-osmosis-inheritance-check.git
cd dbt-osmosis-inheritance-check/
python3 -m venv env
source env/bin/activate
pip install -r requirements.txt
```

2. Copy `profiles.yml.sample` to create `profiles.yml` .
3. Replace `YOUR_GC_PROJECT_ID` with your GC project ID.
4. Run `dbt run` .

## Verifying

1. The contents of `_source.yml` should be as follows.

```yaml
version: 2

sources:
  - name: tmp_dbt_osmosis_test
    database: YOUR_GC_PROJECT_ID
    tables:
      - name: raw_items
      - name: raw_shops
      - name: raw_item_shops
```

2. Empty the contents of `_schema.yml`.

3. Run dbt-osmosis

```
dbt-osmosis yaml refactor --add-progenitor-to-meta --force-inheritance
dbt-osmosis yaml refactor --add-progenitor-to-meta --force-inheritance
```

Run dbt-osmosis twice, because there are places where osmosis_progenitor is not mentioned if you run it only once.
