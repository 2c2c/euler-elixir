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

  @doc """
  Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

  1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

  By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
  """
  def p2 do
    stream = 1..999
    stream
    |> Stream.map(fn(i) -> fib(i) end)
    |> Stream.filter(fn(i) -> rem(i,2) == 0 end)
    |> Stream.take_while(fn(i) -> i <= 4_000_000 end)
    |> Enum.sum
  end
  defp fib(n) when n <= 1, do: 1
  defp fib(n), do: fib(n-2) + fib(n-1)


  @doc """
  The prime factors of 13195 are 5, 7, 13 and 29.

  What is the largest prime factor of the number 600851475143 ?
  """
  def p3 do
    n = 600851475143
    Stream.iterate(0, fn(x) -> x + 1 end)
      |> Stream.filter(fn(x) -> prime?(x) end)
      |> Stream.take_while(fn(x) -> x < round(:math.sqrt(n)) end)
      |> Enum.filter(fn(x) -> rem(n, x) == 0 end)
      |> List.last
  end

  def prime?(x) when x in [2, 3, 5, 7, 11, 13, 17], do: true
  def prime?(x) do
    Enum.all?((2..round(:math.sqrt(x))), fn(n) -> rem(x, n) != 0 end)
  end

  @doc """
  A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

  Find the largest palindrome made from the product of two 3-digit numbers.
  """
  def p4 do
    numbers = for i <- 999..100,
                  j <- 999..100, do: {i,j}

    Stream.map(numbers, fn({i,j}) -> i*j end)
    |> Stream.filter(fn(x) -> to_charlist(x) == to_charlist(x) |> Enum.reverse end)
    |> Enum.max
  end

  @doc """
  2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

  What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
  """
  def p5 do
    Stream.iterate(21, fn(n) -> n + 1 end)
    |> Enum.find(fn(n) -> divisible?(n) end)
  end

  defp divisible?(n) do
    Enum.all?(11..20, fn(d) -> rem(n,d) == 0 end)
  end
end
