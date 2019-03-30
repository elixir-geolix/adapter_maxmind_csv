defmodule Geolix.Adapter.MaxMindCSV.Mixfile do
  use Mix.Project

  @url_github "https://github.com/elixir-geolix/adapter_maxmind_csv"

  def project do
    [
      app: :geolix_adapter_maxmind_csv,
      name: "Geolix Adapter: MaxMind CSV",
      version: "0.1.0-dev",
      elixir: "~> 1.5",
      deps: deps(),
      description: "MaxMind CSV adapter for Geolix",
      dialyzer: dialyzer(),
      docs: docs(),
      package: package(),
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.travis": :test
      ],
      test_coverage: [tool: ExCoveralls]
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.0", only: :dev, runtime: false},
      {:dialyxir, "~> 1.0.0-rc", only: :dev, runtime: false},
      {:ecto_sql, "~> 3.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:excoveralls, "~> 0.10", only: :test, runtime: false},
      {:geolix, github: "elixir-geolix/geolix", rev: "ccd4a5d56b992ef65b9cebf0b25b12fb4529929b"},
      {:postgrex, ">= 0.0.0"}
    ]
  end

  defp dialyzer do
    [
      flags: [
        :error_handling,
        :race_conditions,
        :underspecs,
        :unmatched_returns
      ]
    ]
  end

  defp docs do
    [
      main: "Geolix.Adapter.MaxMindCSV",
      source_ref: "master",
      source_url: @url_github
    ]
  end

  defp package do
    %{
      files: ["CHANGELOG.md", "LICENSE", "mix.exs", "README.md", "lib"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => @url_github},
      maintainers: ["Marc Neudert"]
    }
  end
end
