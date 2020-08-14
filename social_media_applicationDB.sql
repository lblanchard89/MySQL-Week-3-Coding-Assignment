create database if not exists social_media_application;

use social_media_application;

drop  table if exists comments;
drop  table if exists posts;
drop  table if exists users;

create table users (
	user_id int(12) not null auto_increment,
	username varchar(20) not null,
	password varchar(20) not null,
    email varchar(20) not null,
	primary key (user_id)
);

create table posts (
	post_id int(12) not null auto_increment,
	user_id int(12) not null,
	post_content varchar(240) not null,
	user_name varchar(20) not null,
	created_at datetime not null
		default current_timestamp,
	primary key (post_id),
	foreign key (user_id) references users(user_id)
);

create table comments (
	comment_id int(12) not null auto_increment,
	post_id int(12) not null,
	user_id int(12) not null,
	comment_content varchar(240) not null,
	created_at datetime not null
		default current_timestamp,
	primary key (comment_id),
	foreign key (post_id) references posts(post_id),
	foreign key (user_id) references users(user_id)
);