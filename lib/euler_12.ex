defmodule Euler_12 do

  defp divisors(n) do
    1..n
      |> Enum.filter(fn(x) -> rem(n, x) == 0 end)
  end

  defp sum(x) do
    1..x
      |> Enum.sum
  end

  def solve do
    1..1000_000
      # |> Stream.map(&IO.inspect(&1))
      |> Stream.take_while(fn (x) -> length(divisors(sum(x))) < 5 end)
      |> Enum.to_list
  end

end
