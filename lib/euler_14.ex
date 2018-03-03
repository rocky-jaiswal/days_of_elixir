defmodule Euler_14 do

  require Timer

  defp calc(num, acc) do
    num = trunc(num)
    dec = num / 2
    inc = (num * 3) + 1
    r = rem(num, 2)
    case { num, r } do
      {1, _} -> length(acc)
      {_, 0} -> calc(dec, [dec | acc])
      {_, 1} -> calc(inc, [inc | acc])
    end
  end

  defp pmap(collection) do
    collection
      |> Enum.map(&(Task.async(fn -> calc(&1, [&1]) end)))
      |> Enum.map(&Task.await/1)
  end

  def collatz do
    Timer.time_it "collatz" do
      1..1_000_000
        |> Enum.chunk_every(100)
        |> Enum.map(fn(arr) -> pmap(arr) end)
        |> List.flatten
        |> Enum.with_index(1)
        |> Enum.max_by(fn(t) -> elem(t, 0) end)
        |> IO.inspect
    end
  end

end
