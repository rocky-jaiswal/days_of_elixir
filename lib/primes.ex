defmodule Primes do

  def primes_bis(n) do
    primes = for num <- 2..n, is_prime?(num), do: num
    #Enum.at primes, 10001 #=> 104759
  end

  defp is_prime?(2), do: true

  defp is_prime?(num) do
    Enum.all?((2..num-1), &(rem(num, &1) != 0))
  end

end
