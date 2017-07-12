defmodule Elixzo.CLI do
  def main(argv) do
    parse_args(argv)
    |> process
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [ help: :boolean], aliases: [h: :help])
    case parse do
      { [help: true ], _, _} -> :help

      _ -> []
    end
  end

  def process(:help) do
    IO.puts """
    usage: elixzo
    """
    System.halt(0)
  end

  def process([]) do
    Elixzo.capture
  end
end
