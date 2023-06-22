defmodule BusApi.Booking.Router do
  use AshJsonApi.Api.Router,
    # Your Ash.Api Module
    api: BusApi.Booking,
    # Your Ash.Registry Module
    registry: BusApi.Booking.Registry
end
