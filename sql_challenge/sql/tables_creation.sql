-- Table: public.continents

-- DROP TABLE IF EXISTS public.continents;

CREATE TABLE IF NOT EXISTS public.continents
(
    continent_code character(2) COLLATE pg_catalog."default",
    continent_name character varying COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.continents
    OWNER to postgres;

-- Table: public.countries

-- DROP TABLE IF EXISTS public.countries;

CREATE TABLE IF NOT EXISTS public.countries
(
    country_code character(3) COLLATE pg_catalog."default" NOT NULL,
    country character varying COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.countries
    OWNER to postgres;

-- Table: public.continent_map

-- DROP TABLE IF EXISTS public.continent_map;

CREATE TABLE IF NOT EXISTS public.continent_map
(
    country_code character(3) COLLATE pg_catalog."default",
    continent_code character(2) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.continent_map
    OWNER to postgres;


-- Table: public.per_capita

-- DROP TABLE IF EXISTS public.per_capita;

CREATE TABLE IF NOT EXISTS public.per_capita
(
    country_code character(3) COLLATE pg_catalog."default",
    year smallint,
    gdp_per_capita numeric
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.per_capita
    OWNER to postgres;
