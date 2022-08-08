defmodule Geolix.Adapter.MaxMindCSV.MixProject do
  use Mix.Project

  @url_changelog "https://hexdocs.pm/geolix_adapter_maxmind_csv/changelog.html"
  @url_github "https://github.com/elixir-geolix/adapter_maxmind_csv"
  @version "0.1.0-dev"

  def project do
    [
      app: :geolix_adapter_maxmind_csv,
      name: "Geolix Adapter: MaxMind CSV",
      version: @version,
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(Mix.env()),
      aliases: aliases(),
      deps: deps(),
      description: "MaxMind CSV adapter for Geolix",
      dialyzer: dialyzer(),
      docs: docs(),
      package: package(),
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test
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
      {:credo, "~> 1.6", only: :dev, runtime: false},
      {:dialyxir, "~> 1.2", only: :dev, runtime: false},
      {:ecto_ip_range, "~> 0.2.0", optional: true},
      {:ecto_network, "~> 1.0", optional: true},
      {:ecto_sql, "~> 3.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:excoveralls, "~> 0.14.0", only: :test, runtime: false},
      {:geolix, "~> 2.0"},
      {:postgrex, ">= 0.0.0"}
    ]
  end

  defp dialyzer do
    [
      flags: [
        :error_handling,
        :underspecs,
        :unmatched_returns
      ],
      plt_add_apps: [:ecto_ip_range, :ecto_network],
      plt_core_path: "plts",
      plt_local_path: "plts"
    ]
  end

  defp docs do
    [
      extras: [
        "CHANGELOG.md",
        LICENSE: [title: "License"],
        "README.md": [title: "Overview"]
      ],
      formatters: ["html"],
      groups_for_modules: [
        "Ecto Samples": [
          Geolix.Adapter.MaxMindCSV.Repo,
          Geolix.Adapter.MaxMindCSV.Schema.ASNBlockCIDR,
          Geolix.Adapter.MaxMindCSV.Schema.ASNBlockDecimal,
          Geolix.Adapter.MaxMindCSV.Schema.ASNBlockIP4R,
          Geolix.Adapter.MaxMindCSV.Schema.ASNBlockIP6R,
          Geolix.Adapter.MaxMindCSV.Schema.CityBlockCIDR,
          Geolix.Adapter.MaxMindCSV.Schema.CityBlockDecimal,
          Geolix.Adapter.MaxMindCSV.Schema.CityBlockIP4R,
          Geolix.Adapter.MaxMindCSV.Schema.CityBlockIP6R,
          Geolix.Adapter.MaxMindCSV.Schema.CityLocation,
          Geolix.Adapter.MaxMindCSV.Schema.CountryBlockCIDR,
          Geolix.Adapter.MaxMindCSV.Schema.CountryBlockDecimal,
          Geolix.Adapter.MaxMindCSV.Schema.CountryBlockIP4R,
          Geolix.Adapter.MaxMindCSV.Schema.CountryBlockIP6R,
          Geolix.Adapter.MaxMindCSV.Schema.CountryLocation
        ]
      ],
      main: "Geolix.Adapter.MaxMindCSV",
      source_ref: "v#{@version}",
      source_url: @url_github
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    %{
      files: ["CHANGELOG.md", "LICENSE", "mix.exs", "README.md", "lib", "priv"],
      licenses: ["Apache-2.0"],
      links: %{
        "Changelog" => @url_changelog,
        "GitHub" => @url_github
      }
    }
  end
end
