defmodule Euler_20 do

  def calc do
    1..100
      |> Enum.reduce(1, fn(e, acc) -> acc * e end)
      |> to_string
      |> String.split(~r//)
      |> Enum.filter(fn(s) -> String.match?(s, ~r/\d/) end)
      |> Enum.reduce(0, fn(e, acc) -> elem(Integer.parse(e), 0) + acc end)
  end

end
