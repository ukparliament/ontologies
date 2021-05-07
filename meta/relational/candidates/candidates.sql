--create users:
create table users(

	user_id serial primary key,
	user_name varchar(32) not null unique,
	user_password varchar(255) not null,
	user_salt varchar(255) not null,
	user_role integer not null
);

--create boundary_sets:
create table boundary_sets(

	boundary_set_id serial primary key,
	boundary_set_name varchar(128) not null unique,
	created_by integer not null default 1,
	created_at timestamp not null default now(),
	updated_by integer not null default 1,
	updated_at timestamp not null default now(),
	foreign key(created_by) references users(user_id) on delete set default,
	foreign key(updated_by) references users(user_id) on delete set default
);

--create general_elections:
create table general_elections(

	general_election_id serial primary key,
	general_election_name varchar(128) not null unique,
	general_election_notional boolean not null default FALSE,
	boundary_set_id integer not null,
	created_by integer not null default 1,
	created_at timestamp not null default now(),
	updated_by integer not null default 1,
	updated_at timestamp not null default now(),
	unique(general_election_id, boundary_set_id),
	foreign key(boundary_set_id) references boundary_sets(boundary_set_id) on delete cascade,
	foreign key(created_by) references users(user_id) on delete set default,
	foreign key(updated_by) references users(user_id) on delete set default
);

--create parties:
create table parties(

	party_id serial primary key,
	party_name varchar(256) not null unique,
	party_abbreviation varchar(256) not null unique,
	party_priority integer not null,
	party_color varchar(7),
	mnis_id integer,
	mnis_name varchar(256),
	mnis_abbreviation varchar(256),
	mnis_color varchar(7),
	mnis_text_color varchar(7),
	created_by integer not null default 1,
	created_at timestamp not null default now(),
	updated_by integer not null default 1,
	updated_at timestamp not null default now(),
	foreign key(created_by) references users(user_id) on delete set default,
	foreign key(updated_by) references users(user_id) on delete set default
);

--create constituencies:
create table constituencies(

	constituency_id serial primary key,
	constituency_name varchar(256) not null unique,
	mnis_id integer not null unique,
	pa_id integer not null unique,
	ons_id varchar(16) not null unique,
	region_name varchar(256) not null,
	ons_region_id varchar(16) not null,
	county_name varchar(256) not null,
	country_name varchar(256) not null,
	borough_constituency boolean not null,
	boundary_set_id integer not null,
	created_by integer not null default 1,
	created_at timestamp not null default now(),
	updated_by integer not null default 1,
	updated_at timestamp not null default now(),
	unique(constituency_id, boundary_set_id),
	foreign key(boundary_set_id) references boundary_sets(boundary_set_id) on delete cascade,
	foreign key(created_by) references users(user_id) on delete set default,
	foreign key(updated_by) references users(user_id) on delete set default
);

--create general_election_constituencies:
create table general_election_constituencies(

	general_election_id integer not null,
	constituency_id integer not null,
	boundary_set_id integer not null,
	electorate integer,
	valid_votes integer,
	invalid_votes integer,
	declaration_time timestamp,
	sources_checked boolean not null default FALSE,
	completed boolean default FALSE,
	completed_by integer,
	verified boolean default FALSE,
	verified_by integer,
	blocked boolean default FALSE,
	blocked_by integer,
	notes varchar(1024),
	created_by integer not null default 1,
	created_at timestamp not null default now(),
	updated_by integer not null default 1,
	updated_at timestamp not null default now(),
	primary key(general_election_id, constituency_id),
	foreign key(general_election_id, boundary_set_id) references general_elections(general_election_id, boundary_set_id) on delete cascade,
	foreign key(constituency_id, boundary_set_id) references constituencies(constituency_id, boundary_set_id) on delete cascade,
	foreign key(completed_by) references users(user_id) on delete set default,
	foreign key(verified_by) references users(user_id) on delete set default,
	foreign key(blocked_by) references users(user_id) on delete set default,
	foreign key(created_by) references users(user_id) on delete set default,
	foreign key(updated_by) references users(user_id) on delete set default
);

--create candidates:
create table candidates(

	candidate_id serial primary key,
	general_election_id integer not null,
	constituency_id integer not null,
	party_id integer not null,
	firstname varchar(256) not null,
	surname varchar(256) not null,
	middlenames varchar(256),
	title varchar(128),
	date_of_birth date,
	gender boolean,
	sitting_mp boolean,
	former_mp boolean,
	mnis_id integer,
	votes integer,
	notes varchar(1024),
	created_by integer not null default 1,
	created_at timestamp not null default now(),
	updated_by integer not null default 1,
	updated_at timestamp not null default now(),
	unique(general_election_id, constituency_id, candidate_id),
	foreign key(general_election_id, constituency_id) references general_election_constituencies(general_election_id, constituency_id) on delete cascade,
	foreign key(party_id) references parties(party_id) on delete cascade,
	foreign key(created_by) references users(user_id) on delete set default,
	foreign key(updated_by) references users(user_id) on delete set default
);

--create winning_candidates:
create table winning_candidates(

	general_election_id integer not null,
	constituency_id integer not null,
	candidate_id integer not null,
	created_by integer not null default 1,
	created_at timestamp not null default now(),
	updated_by integer not null default 1,
	updated_at timestamp not null default now(),
	unique(general_election_id, constituency_id),
	foreign key(general_election_id, constituency_id, candidate_id) references candidates(general_election_id, constituency_id, candidate_id) on delete cascade,
	foreign key(created_by) references users(user_id) on delete set default,
	foreign key(updated_by) references users(user_id) on delete set default
);
