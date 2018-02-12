defmodule Euler_7 do

  defp filter_non_primes(x, num, count \\ 0, acc \\ []) do
    n = :math.pow(x, 2) + (x * count)
    if n <= num do
      acc = acc ++ [n]
      filter_non_primes(x, num, count + 1, acc)
    else
      acc
    end
  end

  defp pmap(collection, num) do
    collection
      |> Enum.map(&(Task.async(fn -> filter_non_primes(&1, num) end)))
      |> Enum.map(&Task.await/1)
  end

  def prime_sieve do
    num = 10000
    sqrt = trunc(Float.ceil :math.sqrt num)

    non_primes = pmap(2..sqrt, num)
      |> List.flatten
      |> Enum.map(fn (x) -> trunc(x) end)

    Enum.to_list(2..num) -- non_primes
  end

end
