defmodule BusApi.Booking.Registry do
  use Ash.Registry

  entries do
    entry BusApi.Booking.Resources.Vehicle
    entry BusApi.Booking.Resources.Seat
    entry BusApi.Booking.Resources.Location
    entry BusApi.Booking.Resources.Route
    entry BusApi.Booking.Resources.GeoPoint
    entry BusApi.Booking.Resources.Trip
  end
end
