defmodule BusApiTest do
  use ExUnit.Case
  doctest BusApi

  test "greets the world" do
    assert BusApi.hello() == :world
  end
end
