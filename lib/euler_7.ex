defmodule Euler_7 do

  defp mutate_state(x, num, count \\ 0, acc \\ []) do
    n = :math.pow(x, 2) + (x * count)
    if n <= num do
      acc = acc ++ [n]
      mutate_state(x, num, count + 1, acc)
    else
      acc
    end
  end

  def prime_sieve do
    num = 100
    sqrt = trunc(Float.ceil :math.sqrt num)

    state = 2..num
      |> Enum.reduce(%{}, fn (x, acc) -> Map.put(acc, x, true) end)

    non_primes = 2..sqrt
      |> Enum.flat_map(
        fn (x) ->
          if Map.fetch state, x do
            mutate_state(trunc(x), num)
          else
            []
          end
        end
      )
      |> Enum.map(fn (x) -> trunc(x) end)

    Enum.sort(Map.keys(state) -- non_primes)
  end

end
