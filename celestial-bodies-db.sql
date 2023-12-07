--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: blackhole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.blackhole (
    blackhole_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius_in_solar_radius numeric,
    description text
);


ALTER TABLE public.blackhole OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.blackhole_blackhole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blackhole_blackhole_id_seq OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.blackhole_blackhole_id_seq OWNED BY public.blackhole.blackhole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_billions_of_years numeric,
    radius_in_light_years numeric,
    description text,
    distance_to_earth_in_million_years double precision,
    magnitude double precision
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    orbital_period_in_days integer,
    radius_in_km numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    moon_count numeric NOT NULL,
    has_life boolean,
    has_water boolean,
    description text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    description text,
    distance_in_light_years double precision,
    surface_temp_in_kelvin integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: blackhole blackhole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole ALTER COLUMN blackhole_id SET DEFAULT nextval('public.blackhole_blackhole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: blackhole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.blackhole VALUES (1, 'Gaia BH1', 0.99, 'Closest black hole with being 1560 ly away.');
INSERT INTO public.blackhole VALUES (2, 'TON 618', 40700000000, 'One of the most massive blackholes and it is hyperluminous.');
INSERT INTO public.blackhole VALUES (3, 'Sagittarius A*', 17.249, 'Locates at the Galactic Center of the Milky Way.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.61, 52.850, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10.01, 110.000, 'Andromeda is a barred spiral galaxy like our Milky Way. And it is the closest galaxy to us.', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Cartwheel', 0.3, 65.000, 'Lenticular ring galaxy. It has an extremely complicated and heavily disturbed structure. Cartwheel consists of two rings. It was once a normal spiral galaxy but had a collision.', 489.2, 15.2);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 13.25, 25.000, 'Peculiar galaxy, that means it has an unusual shape. Looks like sombrero.', 29.35, 8);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 0.4003, 30.000, 'Has a supermassive black hole at its heart. Core of the galaxy is quite active. This makes the Whirlpool "Seyfert galaxy".', 23.16, 8.4);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', NULL, 3.500, 'One of the most distant objects visible to naked eye. Thats a dwarf irregular galaxy that has no shape.', 190, 2.7);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 27, 1737.4);
INSERT INTO public.moon VALUES (2, 'Deimos', 3, 1, 6.2);
INSERT INTO public.moon VALUES (3, 'Phobos', 3, 0, 11);
INSERT INTO public.moon VALUES (4, 'Io', 4, 2, 1821.6);
INSERT INTO public.moon VALUES (5, 'Europa', 4, 4, 1560.8);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4, 7, 2631.2);
INSERT INTO public.moon VALUES (7, 'Callisto', 4, 17, 2410.3);
INSERT INTO public.moon VALUES (8, 'Titan', 5, 16, 2576.4);
INSERT INTO public.moon VALUES (11, 'Mimas', 5, 1, 198.2);
INSERT INTO public.moon VALUES (12, 'Enceladus', 5, 1, 252.1);
INSERT INTO public.moon VALUES (13, 'Tethys', 5, 2, 533.0);
INSERT INTO public.moon VALUES (14, 'Dione', 5, 3, 561.4);
INSERT INTO public.moon VALUES (15, 'Triton', 7, 6, 1353.4);
INSERT INTO public.moon VALUES (16, 'Proteus', 7, 1, 218.3);
INSERT INTO public.moon VALUES (17, 'Ariel', 8, 3, 1157.8);
INSERT INTO public.moon VALUES (18, 'Umbriel', 8, 4, 584.8);
INSERT INTO public.moon VALUES (19, 'Titania', 8, 9, 788.9);
INSERT INTO public.moon VALUES (20, 'Oberon', 8, 13, 761.4);
INSERT INTO public.moon VALUES (21, 'Proxima b I', 11, 5, 150.0);
INSERT INTO public.moon VALUES (22, 'Gliese 581g I', 12, 3, 220.0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, true, NULL, 7);
INSERT INTO public.planet VALUES (3, 'Mars', 2, false, false, NULL, 7);
INSERT INTO public.planet VALUES (4, 'Jupiter', 95, false, false, NULL, 7);
INSERT INTO public.planet VALUES (5, 'Saturn', 146, false, false, 'Most beautiful planet', 7);
INSERT INTO public.planet VALUES (6, 'Venus', 0, false, false, 'Rocky planet with the densest atmosphere of all the rocky bodies in our Solar System. Only one with a mass and size thats close to Earth.', 7);
INSERT INTO public.planet VALUES (7, 'Neptune', 14, false, false, 'Blue beauty.', 7);
INSERT INTO public.planet VALUES (8, 'Uranus', 27, false, false, 'Ice giant', 7);
INSERT INTO public.planet VALUES (10, '55 Cancri e', 0, false, false, 'Exoplanet', 8);
INSERT INTO public.planet VALUES (11, 'Proxima b', 1, false, true, 'Potansiyel olarak yaşanabilir gezegen.', 10);
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 3, false, true, 'Süper-Dünya adayı olarak tanımlanan gezegen.', 9);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 0, false, true, 'super-Earth planet, similar to Earth in size and orbit, maybe supports life', 11);
INSERT INTO public.planet VALUES (2, 'TRAPPIST-1e', 0, false, false, 'A potentially habitable planet in the TRAPPIST-1 system, falsy values are likely but unknown', 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Polaris', 1, 'AKA North Star or Pole Star. Brightest Ursa Minor star. Can help you find your way in the night.', 433, NULL);
INSERT INTO public.star VALUES (3, 'Alpheratz', 2, NULL, 96.87, 13000);
INSERT INTO public.star VALUES (4, 'Mirach', 2, NULL, 199, 3842);
INSERT INTO public.star VALUES (5, 'VY Canis Majoris', 1, 'Extreme oxygen-rich red hypergiant. Largest star in our galaxy. 2000x Sun. But near half in the surface temperature, because of its big surface and low fuel as we call it red giant.', 4892, 3490);
INSERT INTO public.star VALUES (6, 'Bellatrix', 1, NULL, 244.6, 22000);
INSERT INTO public.star VALUES (7, 'Sun', 1, 'A massive, hot ball of plasma, inflated and heated by energy produced by nuclear fusion reactions at its core.', 1.581e-05, 5772);
INSERT INTO public.star VALUES (8, '55 Cancri A', 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES (10, 'Proxima Centauri', 1, '12% mass of our sun. Closest neighboring star.', 4.24, 3042);
INSERT INTO public.star VALUES (9, 'Gliese 581', 1, 'Significantly smaller and cooler than our sun, with only about 38% of its mass and luminosity.', 20.3, 3480);
INSERT INTO public.star VALUES (11, 'Kepler-186', 1, 'M-dwarf star with a potentially habitable planet in its orbit.', 492, 3530);
INSERT INTO public.star VALUES (12, 'TRAPPIST-1', 1, 'Ultracool dwarf star with seven potentially habitable planets in its orbit.', 39.13, 2511);


--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.blackhole_blackhole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: blackhole blackhole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_pkey PRIMARY KEY (blackhole_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: blackhole unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

