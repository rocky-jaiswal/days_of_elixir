defmodule Euler_4_Test do
  use ExUnit.Case

  test "finds largest palindrome" do
    assert Euler_4.calculate_largest_palindrome == 906609
  end
end
