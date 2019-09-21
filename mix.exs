defmodule Geolix.Adapter.MaxMindCSV.Mixfile do
  use Mix.Project

  @url_github "https://github.com/elixir-geolix/adapter_maxmind_csv"

  def project do
    [
      app: :geolix_adapter_maxmind_csv,
      name: "Geolix Adapter: MaxMind CSV",
      version: "0.1.0-dev",
      elixir: "~> 1.6",
      elixirc_paths: elixirc_paths(Mix.env()),
      aliases: aliases(),
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

  defp aliases do
    [
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"]
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.0", only: :dev, runtime: false},
      {:dialyxir, "~> 1.0.0-rc", only: :dev, runtime: false},
      {:ecto_sql, "~> 3.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:excoveralls, "~> 0.11", only: :test, runtime: false},
      {:geolix, "~> 1.0"},
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

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    %{
      files: ["CHANGELOG.md", "LICENSE", "mix.exs", "README.md", "lib"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => @url_github},
      maintainers: ["Marc Neudert"]
    }
  end
end
