defmodule Euler_9 do

  def pythagorean do
    for a <- 1..500,
        b <- 1..500,
        c <- 1..500,
        a + b + c == 1000,
        a*a + b*b == c*c,
        do: {a, b, c}
  end

end
