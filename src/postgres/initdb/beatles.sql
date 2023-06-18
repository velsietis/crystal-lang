/* Create a database with a table called "Beatles" */
DROP TABLE IF EXISTS "beatles";
DROP SEQUENCE IF EXISTS "beatles_id_seq";
CREATE SEQUENCE "beatles_id_seq";

CREATE TABLE "public"."beatles" (
    "id" smallint DEFAULT nextval('"beatles_id_seq"') NOT NULL,
    "name" character varying(32) NOT NULL,   
    CONSTRAINT "beatles_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "beatles" ("name", "id") VALUES
('George',	1),
('Paul',	2),
('Ringo',	3),
('John',	4);