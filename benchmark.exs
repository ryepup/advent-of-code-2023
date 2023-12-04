lines = File.stream!("./data/day1.txt")

Benchee.run(
  %{
    "part 1" => fn -> Advent2023.Day1.solve(lines, :one) end,
    "part 2" => fn -> Advent2023.Day1.solve(lines, :two) end
  },
  # save: %{}
  load: "benchmark.benchee"
)
