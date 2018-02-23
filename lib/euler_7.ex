defmodule PrimeState do
  use GenServer

  # Client side
  def start_link(num) do
    state = 2..num
      |> Enum.reduce(%{}, fn (x, acc) -> Map.put(acc, x, true) end)

    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def get_state(pid) do
    GenServer.call(pid, :get_state)
  end

  def update_state(pid, e) do
    GenServer.cast(pid, {:update_state, e})
  end

  # Server side
  def init(state), do: {:ok, state}

  def handle_call(:get_state, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:update_state, e}, state) do
    {:noreply, Map.put(state, trunc(e), false)}
  end

end

defmodule Euler_7 do

  defp filter_non_primes(x, num, pid, no_check \\ false, count \\ 0) do
    if no_check || Map.fetch(PrimeState.get_state(pid), x) == {:ok, true} do
      n = :math.pow(x, 2) + (x * count)
      if n <= num do
        PrimeState.update_state(pid, trunc(n))
        filter_non_primes(x, num, pid, true, count + 1)
      end
    end
  end

  def prime_sieve(num) do
    {:ok, pid} = PrimeState.start_link(num)

    2..trunc(Float.ceil :math.sqrt num)
      |> Enum.map(fn(e) -> trunc(e) end)
      |> Enum.each(fn (e) -> filter_non_primes(e, num, pid) end)

    new_state = PrimeState.get_state pid

    Map.keys(new_state)
      |> Enum.filter(fn (k) -> Map.fetch(new_state, k) == {:ok, true}  end)
      |> Enum.sort

  end

end
