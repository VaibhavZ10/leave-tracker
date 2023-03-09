alter table "public"."status" alter column "pending" drop not null;
alter table "public"."status" add column "pending" text;
