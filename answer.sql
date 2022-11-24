select
	aa.media_channel,
	sum(case when af.from_state = 'COLLECTED' then 1 else 0 end) as collected,
	sum(case when af.to_state = 'APPROVED IN MODERATION' or af.to_state = 'REJECTED IN MODERATION' then 1 else 0 end) as moderated,
	sum(case when af.to_state = 'APPROVED IN MODERATION' then 1 else 0 end) as approved_in_mod,
	sum(case when af.to_state = 'TAGGED' then 1 else 0 end) as tagged,
	sum(case when af.to_state = 'RELEASED TO WIDGETS' then 1 else 0 end) as released_to_widgets
from asset_acquisition aa
inner join asset_flow af on aa.asset_id = af.asset_id
where aa.acquisition_at > current_date - INTERVAL '30 days'
group by 1;

select
	media_channel,
	collected,
	moderated,
	approved_in_mod,
	round(1.0 * approved_in_mod / collected, 2) as quality_asset
from sample;

select
	*,
	collected - moderated as not_moderated,
	approved_in_mod - tagged as not_tagged,
	(collected - moderated) + (approved_in_mod - tagged) as denied,
	round(1.0 * ((collected - moderated) + (approved_in_mod - tagged)) / collected, 2) as bad_quality
from sample;

/*
The performance of the query, beyond any kind of optimization, is not great as the data required
to build the funnel is processed and calculated in real time. What options would you recommend
to reduce the calculation time of the funnel, considering different stakeholders evaluate it using
different time periods.

If possible I'll do the following:
 1. Save the data in columnar format, partitioned by the most used time period.
 2. Save all the data required for the funnel analysis in the same table, to avoid joins.
 3. If the stakeholders wants the data in real time, we should use a streaming solution such as apache spark and updating the metrics per mini batch
 4. If the stakeholders frequently checks the data with specific time slices (i.e. 30 days), materialize the tables based on the insert logic on source table
*/

/*
Define the structure of a table that can be used to store calculated funnel data so that it can be
queried much more easily and efficiently. What data pipelines need to be in place to keep this
table populated and updated?


*/

/*
The funnel is just one use case that has been identified as a bottleneck. How would you identify
other use cases where performance and calculation times could be improved?


*/