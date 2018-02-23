defmodule Euler_15 do

  def calc do
    1..1000
      |> Enum.reduce(1, fn(_e, acc) -> acc * 2 end)
      |> to_string
      |> String.split(~r//)
      |> Enum.filter(fn(s) -> String.match?(s, ~r/\d/) end)
      |> Enum.reduce(0, fn(e, acc) -> elem(Integer.parse(e), 0) + acc end)
  end

end
