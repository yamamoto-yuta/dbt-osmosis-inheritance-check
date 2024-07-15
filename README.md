# dbt-osmosis-inheritance-check

Repository for verifying dbt-osmosis inheritance.

## Setup

```
git clone git@github.com:yamamoto-yuta/dbt-osmosis-inheritance-check.git
cd dbt-osmosis-inheritance-check/
python3 -m venv env
source env/bin/activate
pip install -r requirements.txt
```

## Verifying

Run dbt-osmosis twice, because there are places where osmosis_progenitor is not mentioned if you run it only once.

```
dbt-osmosis yaml refactor --add-progenitor-to-meta --force-inheritance
dbt-osmosis yaml refactor --add-progenitor-to-meta --force-inheritance
```
