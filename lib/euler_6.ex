defmodule Euler_6 do

  def sum_squares do
    (50 * 50 * 101 * 101) -
    (1..100
      |> Enum.map(fn(x) -> x * x end)
      |> Enum.reduce(fn(x, acc) -> x + acc end))
  end

end
