defmodule Euler_7 do

  defp filter_non_primes(x, num, agent, count \\ 0) do
    if Map.fetch(Agent.get(agent, &(&1)), trunc(x)) == {:ok, true} do
      n = :math.pow(x, 2) + (x * count)
      if n <= num do
        Agent.update(agent, fn (state) -> Map.put(state, trunc(n), false) end)
        filter_non_primes(x, num, agent, count + 1)
      end
    end
  end

  def prime_sieve do
    num = 100_000
    sqrt = trunc(Float.ceil :math.sqrt num)

    initial_state = 2..num
      |> Enum.reduce(%{}, fn (x, acc) -> Map.put(acc, x, true) end)

    {_, agent} = Agent.start_link(fn -> initial_state end)

    2..sqrt
      |> Enum.each(fn (e) -> filter_non_primes(e, num, agent) end)

    new_state = Agent.get(agent, &(&1))
    primes = Map.keys(new_state)
      |> Enum.filter(fn (k) -> Map.fetch(new_state, k) == {:ok, true}  end)
      |> Enum.sort

    length primes
  end

end
