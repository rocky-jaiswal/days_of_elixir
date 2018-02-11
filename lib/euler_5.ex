defmodule Euler_5 do

  defp is_divisible_by_all(n) do
    Enum.all?([2520, 11, 13, 16, 17, 19], fn(x) -> rem(n, x) == 0 end)
  end

  def smallest_multiple do
    50400..500_000_000
      |> Enum.find(fn(x) -> is_divisible_by_all(x) end)
  end

end
