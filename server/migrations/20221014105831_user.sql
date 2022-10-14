-- Add migration script here
CREATE TABLE user (
	id SERIAL PRIMARY KEY
	name varchar(255) not null
	email varchar(255) not null
	picture text
	password bytea not null
)

create or replace procedure create_user(name varchar(255), email varchar(255), picture text, password varchar(255))
language plpgsql
as $$
begin
	insert into user (name, email, picture, password) 
	values (name, email, picture, sha256(password));
end;