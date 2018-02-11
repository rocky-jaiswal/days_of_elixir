defmodule Euler_5_Test do
  use ExUnit.Case

  test "finds largest number divisible by all from 1 to 20" do
    assert Euler_5.smallest_multiple == 232792560
  end
end
