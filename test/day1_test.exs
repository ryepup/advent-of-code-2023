defmodule Day1Test do
  use ExUnit.Case
  doctest Advent2023.Day1

  test "example input" do
    lines =
      String.split(
        "1abc2
    pqr3stu8vwx
    a1b2c3d4e5f
    treb7uchet",
        "\n"
      )

    assert Advent2023.Day1.solve(lines) == 142
  end

  test "day1.txt" do
    lines = File.stream!("./data/day1.txt")
    assert Advent2023.Day1.solve(lines) == 55029
  end
end
