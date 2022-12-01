# Social Native

## Comments
You can run `docker compose up -d` if you have docker installed in your computer in order to have a postgresql instance where to run the queries.

## Question #1
Write a query to create a funnel showing, for the assets collected in the last 30 days, how many
of them were collected, moderated, approved in moderation, tagged and released to widgets,
splitting by media channel.

```sql
with table1 as (
select aa.id, aa.acquisition_at, aa.media_channel
from asset_acquisition aa
)
select
	ta.media_channel,
	count(ta.id) as collected2,
	--sum(case when af.from_state = 'COLLECTED' then 1 else 0 end) as collected,
	sum(case when af.to_state = 'APPROVED IN MODERATION' or af.to_state = 'REJECTED IN MODERATION' then 1 else 0 end) as moderated,
	sum(case when af.to_state = 'APPROVED IN MODERATION' then 1 else 0 end) as approved_in_mod,
	sum(case when af.to_state = 'TAGGED' then 1 else 0 end) as tagged,
	sum(case when af.to_state = 'RELEASED TO WIDGETS' then 1 else 0 end) as released_to_widgets
from table1 ta
left join asset_flow af on ta.id = af.id
where ta.acquisition_at > current_date - INTERVAL '30 days'
group by 1;
```

## Question #2
Using the table from (a) as reference, how would you assess the quality of the assets from the
different media channels? Which channel has the highest quality assets? In this case, consider
an asset to be of ‘good’ quality if it was approved in moderation.

```sql
select
	media_channel,
	collected,
	moderated,
	approved_in_mod,
	round(1.0 * approved_in_mod / collected, 2) as quality_asset
from sample;
```
I would measure the quality of the assets by understanding the drop off ratio from the collected assets to the approved in moderation. The one with the highest ratio would have the best quality.

## Question #3
Using the table from (a) as reference, how would you determine the rejection rate of assets from
the different media channels? Which channel has the highest rejection rate? In this case,
consider an asset to be rejected if it was either rejected in moderation or in tagging.

```sql
select
	*,
	collected - moderated as not_moderated,
	approved_in_mod - tagged as not_tagged,
	(collected - moderated) + (approved_in_mod - tagged) as denied,
	round(1.0 * ((collected - moderated) + (approved_in_mod - tagged)) / collected, 2) as bad_quality
from sample;
```

I would consider to have a data column named `denied` which sum the amount of rejections. After that, would consider to have a ratio using the collected column (base number) in order to create a ratio.
Although this is not 100% accurate because a denied in tagged step is different from the denied in approved in mod.
We could also consider create two ratios, `denied in moderation / collected` and `denied in tagged / collected` and get an average between both ratios to have the final approximation.

## Question #4
The performance of the query, beyond any kind of optimization, is not great as the data required
to build the funnel is processed and calculated in real time. What options would you recommend
to reduce the calculation time of the funnel, considering different stakeholders evaluate it using
different time periods.

```
If possible I'll do the following:
 1. Save the data in columnar format, partitioned by the date field (if on data lake).
 2. Save all the data required for the funnel analysis in the same table, to avoid joins.
 3. If the stakeholders wants the data in real time, we should use a streaming solution such as apache spark and updating the metrics per mini batch
 4. If the stakeholders frequently checks the data with specific time slices (i.e. 30 days), materialize the tables based on the insert logic on source table
```

## Question #5

Define the structure of a table that can be used to store calculated funnel data so that it can be
queried much more easily and efficiently. What data pipelines need to be in place to keep this
table populated and updated?

```
Understanding that business users would like to see the data sliced by ranges (15, 30 days, etc), a nice first approach could be materialize the results for faster loads.
Table layout could be something as below:

date_slice|media_channel|collected|moderated|approved_in_mod|tagged|released_to_widgets|
----------+-------------+---------+---------+---------------+------+-------------------+
15 days   |instagram    |       10|        9|              6|     6|                  5|
15 days   |twitter      |       10|        9|              6|     6|                  5|
30 days   |instagram    |       10|        9|              6|     6|                  5|
30 days   |twitter      |       10|        9|              6|     6|                  5|

The data pipeline would look like this:
 1. Extract data from source and load it in a raw table
 2. Shape the data in order to have it ready for funnel transformation (for eg. add the media_channel field to the asset_flow table)
 3. Taking benefit of the columnar database and the partition field (if on data lake), we run the computation to get the updated values and we merge the results into the table
 4. Either we archive or remove old results, depending of the business need

Disclaimer:
 - This approach would work for a batch mode, for a streaming mode would be different
 - It will mainly rely on a streaming solution that keeps updating each media_channel, with no time slice.
```

silver
id, media channel, state, acquisition_at, status_date, date_slice
1, instagram, collected, 01/01/2020, 02/01/2020, 10

date_slice|media_channel|collected|moderated|approved_in_mod|tagged|released_to_widgets|
----------+-------------+---------+---------+---------------+------+-------------------+
15 days   |instagram    |       10|        9|              6|     6|                  5|

select 
	date,
	media_channel,
	sum(case when media_channel = 'COLLECTED' then 1 else 0) end as collected
from table1
where date = current_date
group by 1

## Question #6
The funnel is just one use case that has been identified as a bottleneck. How would you identify
other use cases where performance and calculation times could be improved?

```
I would review the scenarios in the following way:
 - Check the existent pipelines and its runtime, to understand if any long running pipeline
 - Validate commonly used queries against the database to validate if any optimization can be done
 - Understand the cadence of the reports that the business users wants and if it is really the required.
 - Review if the technologies used applies for the use cases or can be improved.
```
