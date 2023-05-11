defmodule ShuttleApi.Booking.Router do
  use AshJsonApi.Api.Router,
    # Your Ash.Api Module
    api: ShuttleApi.Booking,
    # Your Ash.Registry Module
    registry: ShuttleApi.Booking.Registry
end
