alter table "public"."status"
    add constraint "status_pkey"
    primary key ("approved", "pending");
