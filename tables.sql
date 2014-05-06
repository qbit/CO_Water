drop table if exists water_source;

drop table if exists location;
create table location (
	id serial unique,
	name text,
	year timestamp without time zone,
	pwsid varchar(30),
	fips varchar(10)
);

drop table if exists source_type;
create table source_type (
	id serial unique,
	name text
);

drop table if exists water_type;
create table water_type (
	id serial unique,
	name text
);

drop table if exists pot_cont_src;
create table pot_cont_src (
	id serial unique,
	name text
);

create table water_source (
	id serial unique, 
	name text,
	src_id int references source_type (id),
	wtr_id int references water_type (id),
	pot_contam_src int references pot_cont_src (id) on delete cascade
);
