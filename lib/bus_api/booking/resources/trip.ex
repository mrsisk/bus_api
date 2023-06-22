defmodule BusApi.Booking.Resources.Trip do
  use Ash.Resource, data_layer: AshPostgres.DataLayer, extensions: [AshJsonApi.Resource]
  require Ash.Query

  postgres do
    table "trip"
    repo(BusApi.Repo)
  end

  attributes do
    uuid_primary_key :id
    attribute :description, :string
    attribute :fee, :decimal
    attribute :depart_time, :utc_datetime_usec
    attribute :arrive_time, :utc_datetime_usec
    create_timestamp :inserted_at
    update_timestamp :updated_at
  end

  actions do
    defaults [:create, :read, :update, :destroy]

    create :new do
      accept [:description, :fee, :depart_time, :arrive_time]

      argument :route_id, :uuid do
        allow_nil? false
      end

      change manage_relationship(:route_id, :route, type: :append_and_remove)
    end
  end

  relationships do
    belongs_to :route, BusApi.Booking.Resources.Route
  end
end
