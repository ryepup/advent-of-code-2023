defmodule Advent2023.Day2 do
  def solve(lines, :one) do
    limits = %{:red => 12, :green => 13, :blue => 14}

    lines
    |> Enum.map(&parseGame/1)
    |> Enum.filter(&possible?(&1, limits))
    |> Enum.map(& &1.id)
    |> Enum.sum()
  end

  def solve(lines, :two) do
    lines
    |> Enum.map(&parseGame/1)
    |> Enum.map(&fewest/1)
    |> Enum.map(&power/1)
    |> Enum.sum()
  end

  defmodule Draw do
    @enforce_keys [:color, :count]
    defstruct [:color, :count]
  end

  defmodule Turn do
    defstruct draws: []
  end

  defmodule Game do
    defstruct id: 0, turns: []
  end

  defp parseGame(line) do
    case line |> String.trim() |> String.split(":") do
      [<<"Game ", id::binary>>, spec] ->
        %Game{id: String.to_integer(id), turns: parseTurns(spec)}
    end
  end

  defp parseTurns(spec) do
    spec |> String.split(";") |> Enum.map(&parseTurn/1)
  end

  defp parseTurn(spec) do
    %Turn{draws: parseDraws(spec)}
  end

  defp parseDraws(spec) do
    spec |> String.split(",") |> Enum.map(&parseDraw/1)
  end

  defp parseDraw(spec) do
    case spec |> String.trim() |> String.split(" ") do
      [num, color] -> %Draw{count: String.to_integer(num), color: String.to_atom(color)}
    end
  end

  defp possible?(%Game{turns: turns}, limits) do
    turns |> Enum.flat_map(& &1.draws) |> Enum.all?(&possible?(&1, limits))
  end

  defp possible?(%Draw{color: color, count: count}, limits) do
    case limits[color] do
      nil -> :error
      x when x >= count -> true
      x when x < count -> false
    end
  end

  defp fewest(%Game{turns: turns}) do
    turns |> Enum.flat_map(& &1.draws) |> Enum.reduce(%{}, &fewest/2)
  end

  defp fewest(%Draw{color: color, count: count}, acc) do
    case acc[color] do
      nil -> Map.put(acc, color, count)
      x when x > count -> acc
      x when x <= count -> Map.put(acc, color, count)
    end
  end

  defp power(acc) do
    acc |> Map.values() |> Enum.reduce(1, &(&1 * &2))
  end
end
