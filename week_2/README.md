# Week 2

Make sure to Navigate into the week_2 folder root before running any of the following commands.


## Serve the Prefect UI

Once running the following command the UI should open on port http://127.0.0.1:4200
```bash
prefect orion start
```

## Register the prefect block
```
prefect block register -m prefect_gcp
```

Then add the GCS bucket through the UI

## Run the flow that loads raw csv data into storage
```
flows/gcp/etl_web_to_gcs.py
```

## Run the flow that loads the data from storage to GCP BigQuery
```bash
flows/gcp/etl_gcs_to_bq.py
```