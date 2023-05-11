defmodule ShuttleApiTest do
  use ExUnit.Case
  doctest ShuttleApi

  test "greets the world" do
    assert ShuttleApi.hello() == :world
  end
end
