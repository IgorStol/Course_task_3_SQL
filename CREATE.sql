CREATE TABLE IF NOT EXISTS genres 
(
	gen_id int PRIMARY KEY,
	gen_name VARCHAR(32) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS musicians 
(
	mus_id int PRIMARY KEY,
	mus_name VARCHAR(32) NOT NULL
);

CREATE TABLE IF NOT EXISTS gen_mus 
(
	gen_id int REFERENCES genres(gen_id),
	mus_id int REFERENCES musicians(mus_id),
	
	CONSTRAINT GM_pkey PRIMARY KEY (gen_id, mus_id)
);

CREATE TABLE IF NOT EXISTS albums 
(
	alb_id int PRIMARY KEY,
	alb_name VARCHAR(32) UNIQUE NOT NULL,
	alb_release date NOT NULL,
	
	CONSTRAINT date_constraint CHECK (alb_release >= '2013-05-03'::date)
);

CREATE TABLE IF NOT EXISTS mus_alb
(
	mus_id int REFERENCES musicians(mus_id),
	alb_id int REFERENCES albums(alb_id),
	
	CONSTRAINT MA_pkey PRIMARY KEY (mus_id, alb_id)
);

CREATE TABLE IF NOT EXISTS treacks 
(
	tr_id int PRIMARY KEY,
	tr_name VARCHAR(32) UNIQUE NOT NULL,
	tr_duration real,
	alb_id int REFERENCES albums(alb_id) NOT NULL,
	CONSTRAINT date_constraint CHECK (tr_duration < 4::int)
);

CREATE TABLE IF NOT EXISTS compilation 
(
	com_id int PRIMARY KEY,
	com_name VARCHAR(32) UNIQUE NOT NULL,
	com_release date NOT NULL,
	
	CONSTRAINT date_constraint CHECK (com_release >= '2020-01-01'::date)
);

CREATE TABLE IF NOT EXISTS com_treacks
(
	tr_id int REFERENCES treacks(tr_id),
	com_id int REFERENCES compilation(com_id),
	
	CONSTRAINT CM_pkey PRIMARY KEY (tr_id, com_id)
);
















