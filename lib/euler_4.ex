defmodule Euler_4 do

  defp is_palindrome(num) do
    String.reverse("#{num}") == "#{num}"
  end

  def calculate_largest_palindrome do
    range = 100..999

    products = fn (r, n) ->
      sub = Enum.map(r, fn (e) -> n * e end)
      Enum.filter(sub, fn (e) -> is_palindrome(e) end)
    end
    Enum.max(Enum.flat_map(range, fn(x) -> products.(range, x) end))
  end

end
