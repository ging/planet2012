CREATE TABLE "comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "coment" varchar(255), "user_id" integer, "site_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "sites" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "description" text, "type_id" integer, "image_url" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "user_id" integer, "image_file_name" varchar(255), "image_content_type" varchar(255), "image_file_size" varchar(255), "image_updated_at" datetime, "visitas" integer DEFAULT 0, "latitud" float, "longitud" float, "zoom" integer);
CREATE TABLE "trips" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "description" text, "date" date, "user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "types" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "description" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255) DEFAULT '' NOT NULL, "encrypted_password" varchar(255) DEFAULT '' NOT NULL, "reset_password_token" varchar(255), "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar(255), "last_sign_in_ip" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "name" varchar(255));
CREATE TABLE "visits" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "trip_id" integer, "site_id" integer, "hour" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20120317231537');

INSERT INTO schema_migrations (version) VALUES ('20120320100145');

INSERT INTO schema_migrations (version) VALUES ('20120328230302');

INSERT INTO schema_migrations (version) VALUES ('20120329060322');

INSERT INTO schema_migrations (version) VALUES ('20120329080433');

INSERT INTO schema_migrations (version) VALUES ('20120409085740');

INSERT INTO schema_migrations (version) VALUES ('20120409143117');

INSERT INTO schema_migrations (version) VALUES ('20120411095828');

INSERT INTO schema_migrations (version) VALUES ('20120411160519');

INSERT INTO schema_migrations (version) VALUES ('20120415210334');

INSERT INTO schema_migrations (version) VALUES ('20120422032309');