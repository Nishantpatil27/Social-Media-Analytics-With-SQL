create database Social_Media_Analytics;

create table `Social_Media_Analytics`.`user_info`(
user_id int  auto_increment primary key,
username varchar(20) unique not null ,
profile_url varchar(500) unique,
full_name varchar(150),
date_of_birth date,
email varchar(50) unique not null ,
passwords  varchar(16) not null,
create_at timestamp default current_timestamp,
id_status varchar(20),
constraint id_status check (id_status in('Active','Deactive','Ban')),
bio text
);


 -- after error Generate foreign key use this code--> "constraint fk_user foreign key  (user_id) references `Social_Media_Analytics`.`user_info` (user_id) on delete cascade"

create table `Social_Media_Analytics`.`post`(
user_id int not null,
post_id int auto_increment primary key,
content text not null,
media_url varchar(13000) not null,
likes_count  int default 0,
comment_count int default 0,
create_at timestamp default current_timestamp,
foreign key  (user_id)
        references `Social_Media_Analytics`.`user_info` (user_id)
        on delete cascade

);


create table `Social_Media_Analytics`.`comment`(
comment_id int auto_increment primary key,
post_id int not null,
user_id int not null,
comment_text text not null,
comment_at timestamp default current_timestamp,
foreign key  (user_id)
        references `Social_Media_Analytics`.`user_info` (user_id)
        on delete cascade,
foreign key  (post_id)
        references `Social_Media_Analytics`.`post` (post_id)
        on delete cascade
);

create table `Social_Media_Analytics`.`like`(
like_id int auto_increment primary key,
post_id int not null,
user_id int not null,
like_at timestamp default current_timestamp,
foreign key  (user_id)
        references `Social_Media_Analytics`.`user_info` (user_id)
        on delete cascade,
foreign key  (post_id)
        references `Social_Media_Analytics`.`post` (post_id)
        on delete cascade
);

create table `Social_Media_Analytics`.`followers`(
follower_id int ,
followed_id int ,
followed_at timestamp default current_timestamp,
foreign key  (follower_id)
        references `Social_Media_Analytics`.`user_info` (user_id)
        on delete cascade,
foreign key  (followed_id)
        references `Social_Media_Analytics`.`post` (user_id)
        on delete cascade
);

create table `Social_Media_Analytics`.`Message`(
message_id  int auto_increment primary key,
sender_id int not null,
send_at timestamp default current_timestamp,
receiver_id int not null,
read_at timestamp,
message text ,
message_at timestamp default current_timestamp,
foreign key  (sender_id)
        references `Social_Media_Analytics`.`user_info` (user_id)
        on delete cascade,
foreign key  (receiver_id)
        references `Social_Media_Analytics`.`post` (user_id)
        on delete cascade
);

create table `Social_Media_Analytics`.`Notifications`(
notifications_id  int auto_increment primary key,
send_at timestamp default current_timestamp,
read_at timestamp,
user_id int not null,
type_notification varchar(50),
constraint type_notification check(type_notification in ('New_like','post','reel','comment','follow','like')),
foreign key  (user_id)
        references `Social_Media_Analytics`.`post` (user_id)
        on delete cascade
);
