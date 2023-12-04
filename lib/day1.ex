defmodule Advent2023.Day1 do
  def solve(lines, part) when part == :one do
    lines
    |> Enum.map(&value/1)
    |> Enum.sum()
  end

  def solve(lines, part) when part == :two do
    lines
    |> Enum.map(&find_number/1)
    |> Enum.sum()
  end

  defp next_number(<<n>> <> _rest) when n in ?0..?9 do
    n - 48
  end

  defp next_number(<<_>> <> rest) do
    next_number(rest)
  end

  defp value(line) do
    first = line |> next_number
    last = line |> String.reverse() |> next_number
    Integer.undigits([first, last])
  end

  defp find_number(line) do
    first = line |> next_word_number(:left_to_right)
    last = line |> String.reverse() |> next_word_number(:right_to_left)
    Integer.undigits([first, last])
  end

  defp next_word_number(<<n>> <> _rest, _dir) when n in ?0..?9 do
    n - 48
  end

  @words "one two three four five six seven eight nine"
         |> String.split()
         |> Enum.with_index()

  for {word, idx} <- @words do
    defp next_word_number(<<unquote(word)>> <> _rest, :left_to_right) do
      unquote(idx + 1)
    end

    defp next_word_number(<<unquote(word |> String.reverse())>> <> _rest, :right_to_left) do
      unquote(idx + 1)
    end
  end

  defp next_word_number(<<_>> <> rest, dir) do
    next_word_number(rest, dir)
  end
end
