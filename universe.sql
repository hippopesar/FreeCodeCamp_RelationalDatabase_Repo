--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    planet_id integer NOT NULL
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
    description text,
    has_life boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    star_id integer NOT NULL
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
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    galaxy_id integer NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, true, true, 13600, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', NULL, false, true, 10100, 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', NULL, false, true, 10000, 3000000);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', NULL, false, true, 13500, 53000000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', NULL, false, true, 400, 23000000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', NULL, false, true, 10000, 29000000);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 1, 'Spiral');
INSERT INTO public.galaxy_type VALUES (2, 2, 'Spiral');
INSERT INTO public.galaxy_type VALUES (3, 3, 'Spiral');
INSERT INTO public.galaxy_type VALUES (4, 4, 'Elliptical');
INSERT INTO public.galaxy_type VALUES (5, 5, 'Spiral');
INSERT INTO public.galaxy_type VALUES (6, 6, 'Lenticular');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Earth’s only natural satellite.', 4500, 0.00257, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'One of Mars’ small, irregular moons.', 4600, 0.00006, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars’ second moon, smaller than Phobos.', 4600, 0.00023, 2);
INSERT INTO public.moon VALUES (4, 'Europa', 'An icy moon of Jupiter with a subsurface ocean.', 4500, 0.6, 3);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Largest moon in the Solar System.', 4500, 0.63, 3);
INSERT INTO public.moon VALUES (6, 'Callisto', 'A heavily cratered moon of Jupiter.', 4500, 0.72, 3);
INSERT INTO public.moon VALUES (7, 'Titan', 'Saturn’s largest moon with a thick atmosphere.', 4500, 1.2, 4);
INSERT INTO public.moon VALUES (8, 'Enceladus', 'Saturn’s icy moon with geysers.', 4500, 1.3, 4);
INSERT INTO public.moon VALUES (9, 'Triton', 'Neptune’s largest moon, retrograde orbit.', 4500, 2.7, 5);
INSERT INTO public.moon VALUES (10, 'Charon', 'Pluto’s largest moon.', 4500, 4.9, 6);
INSERT INTO public.moon VALUES (11, 'Io', 'Jupiter’s volcanic moon.', 4500, 0.42, 3);
INSERT INTO public.moon VALUES (12, 'Oberon', 'A moon of Uranus with an icy surface.', 4500, 2.9, 7);
INSERT INTO public.moon VALUES (13, 'Miranda', 'A small, deformed moon of Uranus.', 4500, 2.6, 7);
INSERT INTO public.moon VALUES (14, 'Hyperion', 'A sponge-like moon of Saturn.', 4500, 1.5, 4);
INSERT INTO public.moon VALUES (15, 'Iapetus', 'Saturn’s moon with a two-tone surface.', 4500, 1.6, 4);
INSERT INTO public.moon VALUES (16, 'Dione', 'A moon of Saturn with bright ice cliffs.', 4500, 1.2, 4);
INSERT INTO public.moon VALUES (17, 'Rhea', 'Saturn’s second-largest moon.', 4500, 1.3, 4);
INSERT INTO public.moon VALUES (18, 'Umbriel', 'A dark moon of Uranus.', 4500, 2.7, 7);
INSERT INTO public.moon VALUES (19, 'Ariel', 'A bright, icy moon of Uranus.', 4500, 2.5, 7);
INSERT INTO public.moon VALUES (20, 'Nereid', 'A distant, irregular moon of Neptune.', 4500, 5.5, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The only known planet with life.', true, 4500, 0, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Known as the Red Planet, potential for past life.', false, 4600, 225, 1);
INSERT INTO public.planet VALUES (3, 'Proxima b', 'An exoplanet in the habitable zone of Proxima Centauri.', false, 5000, 4.24, 6);
INSERT INTO public.planet VALUES (4, 'Kepler-22b', 'A super-Earth in the habitable zone.', false, 6000, 600, 2);
INSERT INTO public.planet VALUES (5, 'Gliese 581g', 'A potentially habitable exoplanet.', false, 7000, 20, 3);
INSERT INTO public.planet VALUES (6, 'Titan', 'A moon of Saturn with a thick atmosphere.', false, 4500, 1.2, 4);
INSERT INTO public.planet VALUES (7, 'Europa', 'An icy moon of Jupiter with a subsurface ocean.', false, 4500, 0.6, 5);
INSERT INTO public.planet VALUES (8, 'HD 209458 b', 'A hot Jupiter with atmospheric studies.', false, 8000, 150, 2);
INSERT INTO public.planet VALUES (9, 'TRAPPIST-1e', 'One of seven Earth-sized planets in TRAPPIST-1 system.', false, 8000, 40, 3);
INSERT INTO public.planet VALUES (10, '55 Cancri e', 'A super-Earth with extreme temperatures.', false, 9000, 41, 4);
INSERT INTO public.planet VALUES (11, 'GJ 1214 b', 'A water-rich exoplanet.', false, 5000, 42, 5);
INSERT INTO public.planet VALUES (12, 'TOI-700 d', 'A potentially habitable exoplanet.', false, 10000, 101, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'Brightest star in the night sky, part of the Canis Major constellation.', 242, 8.6, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'A red supergiant in Orion, known for its potential supernova.', 10, 642.5, 2);
INSERT INTO public.star VALUES (3, 'Vega', 'A bright blue-white star in the Lyra constellation.', 455, 25, 3);
INSERT INTO public.star VALUES (4, 'Antares', 'A massive red supergiant in Scorpius.', 12, 550, 4);
INSERT INTO public.star VALUES (5, 'Rigel', 'A blue supergiant in Orion, one of the brightest stars.', 8, 860, 5);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 'Closest known star to Earth outside the Sun.', 4, 4.24, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: galaxy_type unique_galaxy_type_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT unique_galaxy_type_id UNIQUE (galaxy_type_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: galaxy_type fk_galaxy_type_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT fk_galaxy_type_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

