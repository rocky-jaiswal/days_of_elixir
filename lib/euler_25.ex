defmodule FactState do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [0, 1, 1], name: __MODULE__)
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
    {:noreply, state ++ [e]}
  end

end

defmodule Euler_25 do

  def factorial(n) do
    case {n} do
      {1} -> 1
      {2} -> 1
      {n} -> factorial(n - 1) + factorial(n - 2)
    end
  end

  def memoized_factorial(n, pid) do
    state = FactState.get_state pid
    x = Enum.at(state, n - 1) + Enum.at(state, n - 2)
    FactState.update_state(pid, x)
  end

  def recurse(pid, n \\ 3) do
    memoized_factorial(n, pid)
    state = FactState.get_state pid
    res = Enum.at(state, length(state) - 1)
      |> to_string
      |> String.split("")
      |> length
    if (res >= 1002) do
      n
    else
      recurse(pid, n + 1)
    end
  end

  def solve do
    {:ok, pid} = FactState.start_link
    recurse(pid)
  end

end
