defmodule Euler_22 do

  @scores %{
    "A" => 1,
    "B" => 2,
    "C" => 3,
    "D" => 4,
    "E" => 5,
    "F" => 6,
    "G" => 7,
    "H" => 8,
    "I" => 9,
    "J" => 10,
    "K" => 11,
    "L" => 12,
    "M" => 13,
    "N" => 14,
    "O" => 15,
    "P" => 16,
    "Q" => 17,
    "R" => 18,
    "S" => 19,
    "T" => 20,
    "U" => 21,
    "V" => 22,
    "W" => 23,
    "X" => 24,
    "Y" => 25,
    "Z" => 26
  }

  defp find_score(str) do
    String.split(str, ~r//)
    |> Enum.filter(fn(s) -> s != "" end)
    # |> IO.inspect
    |> Enum.map(fn (s) -> Map.get(@scores, s) end)
    |> Enum.sum
  end

  def solve do
    File.read!("resources/p022_names.txt")
      |> String.split(",")
      |> Enum.map(fn (s) -> String.replace(s, ~r/\"/, "") end)
      |> Enum.sort
      |> Enum.with_index(1)
      |> Enum.map(fn(t) -> find_score(elem(t, 0)) * elem(t, 1) end)
      |> Enum.sum
  end

end
