# advent-of-code-2023

Excuse to learn [Elixir].

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `advent2023` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:advent2023, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/tmp>.

## Learning notes

- pipelines `|>` vs comprehensions `for` is an interesting choice
- feels like I have an overly complicated solution, reversing the list feels to get the final one feels bad
- these docs are fantastic
- integration with vscode and iex could be better, copy/pasting snippets into a terminal is annoying
- [Benchee] is cool
- moving the pattern matching up into the function _definition_ cleans things up a lot code-wise and perf wise. pattern matching is way faster than `Strings.starts_with?`
- can do data-driven metaprogramming without diving all the way into `defmacro`


## References

- <https://hexdocs.pm/elixir/1.16/introduction.html>

[Elixir]: https://elixir-lang.org/
[Benchee]: https://elixirschool.com/en/lessons/misc/benchee
