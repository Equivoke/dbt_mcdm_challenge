# Marketing common data modelling challenge
	This test assignment was completed by Nikita Alekseev

## Task
	At Improvado, we use marketing common data models (MCDM) to map data from various ad 
    platforms into a single one. MCDM can help marketers with questions like: 
    "Where clicks better on facebook or tiktok?"

Imagine that MCDM-model behind dashboard, is lost somehow. You need to rebuilt it. You have:
	— raw data from the ad systems (seeds folder),
	- the MCDM table structure for this report, 
	- and [dashboard](https://lookerstudio.google.com/reporting/fa668749-b82f-41a8-a12e-f7d9c0733b57/page/tEnnC)


## Results and brief set of instructions for adding data from new ad platform

The link to the dbt Cloud repository and the recreated dashboard was submitted via the provided Typeform.

Below is a brief description of how to add a new data source to MCDM:

- chnl - ad platform name
- cpe - cost per engagement
- cc - conversion cost
- ibc - impressions by channel
- cpc - cost per click

To add a new data source:

1. Add the new data into the "seeds" folder.
2. Run the "dbt seed" command in dbt.
3. In "models" folder modify "aggregated_metrics.sql" by uncommenting rows 43-53.
4. Change 'New_channel' to the desired source name.
5. Provide the correct formulas to calculate each metric in rows 48-51 (based on how the columns in the new data source are named or based on business rules).
6. In row 52, add "from {{ ref('new_data_source_name') }}" where 'new_data_source_name' should be actual data source name, you've added at step 1.

If you need to add more than one data source, repeat steps 1-6, adjusting for the relevant row numbers.