defmodule Day1Test do
  use ExUnit.Case
  doctest Advent2023.Day1

  test "part 1: example input" do
    lines =
      String.split(
        "1abc2
    pqr3stu8vwx
    a1b2c3d4e5f
    treb7uchet",
        "\n"
      )

    assert Advent2023.Day1.solve(lines, :one) == 142
  end

  test "part 1: puzzle input" do
    lines = File.stream!("./data/day1.txt")
    assert Advent2023.Day1.solve(lines, :one) == 55029
  end

  test "part 2: example input" do
    lines =
      String.split(
        "two1nine
        eightwothree
        abcone2threexyz
        xtwone3four
        4nineeightseven2
        zoneight234
        7pqrstsixteen",
        "\n"
      )

    assert Advent2023.Day1.solve(lines, :two) == 281
  end

  test "part 2: puzzle input" do
    lines = File.stream!("./data/day1.txt")
    assert Advent2023.Day1.solve(lines, :two) == 55686
  end
end
