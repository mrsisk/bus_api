defmodule ShuttleApi.Booking.Registry do
  use Ash.Registry

  entries do
    entry ShuttleApi.Booking.Resources.Vehicle
    entry ShuttleApi.Booking.Resources.Seat
    entry ShuttleApi.Booking.Resources.Location
    entry ShuttleApi.Booking.Resources.Route
    entry ShuttleApi.Booking.Resources.GeoPoint
    entry ShuttleApi.Booking.Resources.Trip
  end
end
