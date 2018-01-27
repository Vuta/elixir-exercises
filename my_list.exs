defmodule MyList do
  # 1. Write a mapsum function that takes a list and a function.
  # It applies the function to each element of the list and then sum the result.
  # Input: MyList.mapsum([1,2,3], &(&1 * &1))
  # Output: 14
  def mapsum([], _func), do: 0
  def mapsum([head | tail], func) do
    func.(head) + mapsum(tail, func)
  end

  # 2. Write a max(list) that returns the element with the maximum value in the list
  def maximum([]), do: []
  def maximum([x]), do: x
  def maximum([x, y]) when x >= y, do: x
  def maximum([_x, y]), do: y
  def maximum([head | tail]), do: maximum([head, maximum(tail)])

  # 3. Write a function span(x, y) that returns a list of numbers from x up to y.
  def span(x, x), do: [x]
  def span(x, y) when x < y, do: [ x | span(x+1, y) ]
  def span(x, y), do: [ x | span(x-1, y) ]

  # 4. Write a function that returns list of divisors of a number
  def divisors(n), do: divisors(n, 1, [])

  def divisors(n, i, result) when i * i > n, do: result
  def divisors(n, i, result) when i * i == n, do: [i | result]
  def divisors(n, i, result) when rem(n, i) == 0, do: divisors(n, i+1, [i, div(n, i) | result])
  def divisors(n, i, result), do: divisors(n, i+1, result)
end

