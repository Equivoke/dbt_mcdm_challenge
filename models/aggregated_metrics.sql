{{ config(
    materialized='table'
) }}

select 
  'Facebook' as chnl,
  round(sum(spend) / sum(views + comments + shares + likes + clicks), 2) as cpe,
  round(sum(spend) / sum(purchase), 2) as cc,
  sum(impressions) as ibc,
  round(sum(spend) / sum(clicks), 2) as cpc
from {{ ref('src_ads_creative_facebook_all_data') }}

union all

select 
  'Bing' as chnl,
  0 as cpe,
  round(sum(spend) / sum(conv), 2) as cc,
  sum(imps) as ibc,
  round(sum(spend) / sum(clicks), 2) as cpc
from {{ ref('src_ads_bing_all_data') }}

union all

select 
  'TikTok Ads' as chnl,
  0 as cpe,
  round(sum(spend) / sum(conversions), 2) as cc,
  sum(impressions) as ibc,
  round(sum(spend) / sum(clicks), 2) as cpc
from {{ ref('src_ads_tiktok_ads_all_data') }}

union all

select 
  'Twitter' as chnl,
  round(sum(spend) / sum(engagements), 2) as cpe,
  0 as cc,
  sum(impressions) as ibc,
  round(sum(spend) / sum(clicks), 2) as cpc
from {{ ref('src_promoted_tweets_twitter_all_data') }}

/*
union all

select 
  'New_channel' as chnl,
  0 as cpe,
  0 as cc,
  0 as ibc,
  0 as cpc
from {{ ref('new_data_source_name') }}
*/