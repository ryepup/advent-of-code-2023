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

  defp value(line) do
    lst =
      for c <- String.graphemes(line),
          v = Integer.parse(c),
          v != :error do
        c
      end

    [first | _] = lst
    # this is dumb
    [last | _] = Enum.reverse(lst)

    # todo: Integer.undigits([first, last])
    case Integer.parse(first <> last) do
      {x, ""} -> x
    end
  end

  # one:1, two:2, three:3, ...
  @words "one two three four five six seven eight nine"
         |> String.split()
         |> Enum.with_index(&{&1, &2 + 1})
         |> Enum.into([])
  # eno:1, owt:2, eerht:3, ...
  @reversed_words @words |> Enum.map(&put_elem(&1, 0, String.reverse(elem(&1, 0))))

  defp leading_word_to_digit(line, dir) do
    case dir do
      :left_to_right -> @words
      :right_to_left -> @reversed_words
    end
    |> Enum.filter(&String.starts_with?(line, elem(&1, 0)))
    |> Enum.map(&elem(&1, 1))
  end

  defp leading_digit(line) do
    String.at(line, 0) |> Integer.parse()
  end

  defp find_leading(line, dir) do
    # why couldn't I get this to work in a flat cond?
    case leading_digit(line) do
      {d, ""} ->
        d

      # was getting match errors from :error if I tried to ignore it in the cond...
      :error ->
        case leading_word_to_digit(line, dir) do
          [d] ->
            d

          _ ->
            cond do
              String.length(line) > 1 ->
                find_leading(String.slice(line, 1..-1), dir)
            end
        end
    end
  end

  defp find_number(line) do
    first = find_leading(line, :left_to_right)
    last = String.reverse(line) |> find_leading(:right_to_left)
    Integer.undigits([first, last])
  end
end
