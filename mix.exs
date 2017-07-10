defmodule Elixzo.Mixfile do
  use Mix.Project

  @description """
    Screencapture Command Tool for MacOS
  """

  def project do
    [app: :elixzo,
     escript: [main_module: Elixzo],
     version: "0.0.1",
     elixir: "~> 1.4",
     name: "Elixzo",
     description: @description,
     package: package,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger, :ex_aws, :hackney, :poison, :timex]]
  end

  defp deps do
    [
      {:ex_aws, "~> 1.0"},
      {:poison, "~> 2.0"},
      {:hackney, "~> 1.6"},
      {:configparser_ex, "~> 0.2.1"},
      {:timex, "~> 3.0"},
      {:tzdata, "== 0.1.8", override: true},
    ]
  end

  defp package do
    [ maintainers: ["Akihide Kang"],
      licenses: ["MIT"],
      links: %{ "Github" => "https://github.com/kanmo/elixzo" } ]
  end
end
