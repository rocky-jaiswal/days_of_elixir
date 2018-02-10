defmodule DaysOfElixirTest do
  use ExUnit.Case
  doctest DaysOfElixir

  test "greets the world" do
    assert DaysOfElixir.hello() == :world
  end
end
