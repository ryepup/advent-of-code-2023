defmodule Advent2023.Day1 do
  def solve(lines) do
    lines
    |> Enum.map(&value/1)
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

    case Integer.parse(first <> last) do
      {x, ""} -> x
    end
  end
end
