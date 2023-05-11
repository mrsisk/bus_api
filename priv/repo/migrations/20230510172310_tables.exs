defmodule ShuttleApi.Repo.Migrations.Tables do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    create table(:vehicle, primary_key: false) do
      add :id, :uuid, null: false, primary_key: true
      add :model, :text
      add :capacity, :bigint
      add :inserted_at, :utc_datetime_usec, null: false, default: fragment("now()")
      add :updated_at, :utc_datetime_usec, null: false, default: fragment("now()")
    end

    create table(:seat, primary_key: false) do
      add :id, :uuid, null: false, primary_key: true
      add :label, :text
      add :inserted_at, :utc_datetime_usec, null: false, default: fragment("now()")
      add :updated_at, :utc_datetime_usec, null: false, default: fragment("now()")

      add :vehicle_id,
          references(:vehicle,
            column: :id,
            name: "seat_vehicle_id_fkey",
            type: :uuid,
            prefix: "public"
          )
    end

    create table(:route, primary_key: false) do
      add :id, :uuid, null: false, primary_key: true
      add :name, :text
      add :inserted_at, :utc_datetime_usec, null: false, default: fragment("now()")
      add :updated_at, :utc_datetime_usec, null: false, default: fragment("now()")
      add :to_id, :uuid
      add :from_id, :uuid
    end

    create table(:location, primary_key: false) do
      add :id, :uuid, null: false, primary_key: true
    end

    alter table(:route) do
      modify :to_id,
             references(:location,
               column: :id,
               name: "route_to_id_fkey",
               type: :uuid,
               prefix: "public"
             )

      modify :from_id,
             references(:location,
               column: :id,
               name: "route_from_id_fkey",
               type: :uuid,
               prefix: "public"
             )
    end

    alter table(:location) do
      add :name, :text
      add :inserted_at, :utc_datetime_usec, null: false, default: fragment("now()")
      add :updated_at, :utc_datetime_usec, null: false, default: fragment("now()")
    end

    create table(:geo_point, primary_key: false) do
      add :id, :uuid, null: false, primary_key: true
      add :name, :text
      add :lat, :float
      add :lon, :float
      add :inserted_at, :utc_datetime_usec, null: false, default: fragment("now()")
      add :updated_at, :utc_datetime_usec, null: false, default: fragment("now()")

      add :location_id,
          references(:location,
            column: :id,
            name: "geo_point_location_id_fkey",
            type: :uuid,
            prefix: "public"
          )
    end
  end

  def down do
    drop constraint(:geo_point, "geo_point_location_id_fkey")

    drop table(:geo_point)

    alter table(:location) do
      remove :updated_at
      remove :inserted_at
      remove :name
    end

    drop constraint(:route, "route_to_id_fkey")

    drop constraint(:route, "route_from_id_fkey")

    alter table(:route) do
      modify :from_id, :uuid
      modify :to_id, :uuid
    end

    drop table(:location)

    drop table(:route)

    drop constraint(:seat, "seat_vehicle_id_fkey")

    drop table(:seat)

    drop table(:vehicle)
  end
end