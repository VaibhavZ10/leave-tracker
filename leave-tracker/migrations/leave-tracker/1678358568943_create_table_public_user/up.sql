CREATE TABLE "public"."user" ("user_id" serial NOT NULL, "slack_id" integer NOT NULL, "microsoft_id" integer NOT NULL, "name" text NOT NULL, "address" text NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "updated_by" text NOT NULL, "is_admin" boolean NOT NULL, "is_deleted" boolean NOT NULL, "total_leaves" integer NOT NULL, PRIMARY KEY ("user_id") , UNIQUE ("slack_id"));
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_user_updated_at"
BEFORE UPDATE ON "public"."user"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_user_updated_at" ON "public"."user" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
