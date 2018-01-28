defmodule MyEnum do
  # Implement some Enum functions using no library functions or list comprehensions

  # 1. all?
  def all?([], _func), do: true
  def all?([head | tail], func) do
    if func.(head) do
      all?(tail, func)
    else
      false
    end
  end

  # 2. each
  def each([], _func), do: :ok
  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  # 3. filter
  def filter([], _func), do: []
  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  # 4. split
  def split(list, 0), do: {[], list}
  def split([], _leng), do: {[], []}
  def split([head | tail], leng) do
    {left, right} = split(tail, leng - 1)
    {[head | left], right}
  end

  # 5. take
  def take([], _leng), do: []
  def take(_list, 0), do: []
  def take([head | tail], leng) when leng > 0 do
    [head | take(tail, leng - 1)]
  end
  def take([_head | tail], leng) do
    take(tail, leng + 1)
  end

  # 6. flatten
  def flatten([]), do: []
  def flatten([head | tail]), do: flatten(head) ++ flatten(tail)
  def flatten(single), do: [single]
end
