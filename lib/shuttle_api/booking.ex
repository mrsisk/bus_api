defmodule ShuttleApi.Booking do
  use Ash.Api, extensions: [AshJsonApi.Api]

  resources do
    registry ShuttleApi.Booking.Registry
  end

  json_api do
 
  log_errors? true
end

end
