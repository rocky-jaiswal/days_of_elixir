defmodule Euler_18 do

  @triangle "
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"

  # TODO: This logic is wrong!
  def calc do
    {:ok, selected} = Agent.start_link(fn -> [0] end)

    max_index = fn (arr) ->
      allowed = List.last Agent.get(selected, &(&1))
      mapped = arr
        |> Enum.map(fn(e) -> elem(Integer.parse(e), 0) end)
        |> Enum.with_index
        |> Enum.filter(fn(t) -> elem(t, 1) == allowed || elem(t, 1) == (allowed + 1) end)
        |> Enum.max_by(fn(t) -> elem(t, 0) end)

        Agent.update(selected, fn (state) -> state ++ [elem(mapped, 1)] end)
        mapped
      end

      @triangle
      |> String.split(~r/\n/)
      |> Enum.filter(fn(s) -> s !== "" end)
      |> Enum.map(fn(s) -> String.split(s, ~r/\s/) end)
      |> Enum.map(fn(a) -> max_index.(a) end)
      |> Enum.map(fn(t) -> elem(t, 0) end)
      |> IO.inspect
      |> Enum.sum
  end

end
