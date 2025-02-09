--view all tables in sql:-

SELECT * FROM social_media_analytics.user_info;
SELECT * FROM social_media_analytics.post;
SELECT * FROM social_media_analytics.comment;
SELECT * FROM social_media_analytics.like;
SELECT * FROM social_media_analytics.followers;
SELECT * FROM social_media_analytics.message;
SELECT * FROM social_media_analytics.notifications;


--                                   Basic SQL Queries:-


-- Find all users who have provided their bio?
select username,email,bio from social_media_analytics.user_info where bio is not null;  

-- Retrieve the read_at timestamp from the Message table?
select read_at from social_media_analytics.message

-- Get the most recent comments on posts?
select post_id,user_id,comment_id from social_media_analytics.comment order by comment_at desc  limit 5;

--                                    Intermediate SQL Queries



-- Get the count of posts made by each user?
select user_id,count( post_id ) as total_post from social_media_analytics.post group by user_id;

-- List all messages that have been read?
select read_at,message from social_media_analytics.message  where read_at is not null;



--                                       Advanced SQL Queries:



-- Find all posts that have more than 100 likes?
select post_id,likes_count from social_media_analytics.post where likes_count >= 100;

-- Find the most recent notifications for a specific user?
select * from social_media_analytics.notifications where user_id=5 order by send_at desc limit 5;

