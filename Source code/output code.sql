--view all tables in sql:-

SELECT * FROM social_media_analytics.user_info;
SELECT * FROM social_media_analytics.post;
SELECT * FROM social_media_analytics.comment;
SELECT * FROM social_media_analytics.like;
SELECT * FROM social_media_analytics.followers;
SELECT * FROM social_media_analytics.message;
SELECT * FROM social_media_analytics.notifications;


-- Basic SQL Queries:-


-- Find all users who have provided their bio?
select username,email,bio from social_media_analytics.user_info where bio is not null;  

-- Retrieve the read_at timestamp from the Message table?
select read_at from social_media_analytics.message

-- Get the most recent comments on posts?
select post_id,user_id,comment_id from social_media_analytics.comment order by comment_at desc  limit 5;



