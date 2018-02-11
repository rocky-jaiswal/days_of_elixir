defmodule Euler_5 do

  def smallest_multiple do
    remainder = fn (n) -> Enum.all?((1..20), fn(x) -> rem(n, x) == 0 end) end
    1..500_000_000
      |> Enum.find(fn(x) -> remainder.(x) end)
  end

end
