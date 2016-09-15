defmodule Euler do

  @doc """
  If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

  Find the sum of all the multiples of 3 or 5 below 1000.
  """
  def p1 do
    test = for i <- 1..999,
          rem(i,3) == 0 or rem(i,5) == 0, do: i

    Enum.sum(test)
  end
end


def p2 do
  
end
