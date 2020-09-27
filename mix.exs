defmodule Geolix.Adapter.MaxMindCSV.Mixfile do
  use Mix.Project

  @url_github "https://github.com/elixir-geolix/adapter_maxmind_csv"

  def project do
    [
      app: :geolix_adapter_maxmind_csv,
      name: "Geolix Adapter: MaxMind CSV",
      version: "0.1.0-dev",
      elixir: "~> 1.7",
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
      {:dialyxir, "~> 1.0", only: :dev, runtime: false},
      {:ecto_ip_range, "~> 0.1.0", optional: true},
      {:ecto_network, "~> 1.0", optional: true},
      {:ecto_sql, "~> 3.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:excoveralls, "~> 0.13.0", only: :test, runtime: false},
      {:geolix, github: "elixir-geolix/geolix", ref: "1f8d354de10690ed9881971c3355861634489d9b"},
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
      ],
      plt_add_apps: [:ecto_ip_range, :ecto_network]
    ]
  end

  defp docs do
    [
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
      source_ref: "master",
      source_url: @url_github
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    %{
      files: ["CHANGELOG.md", "LICENSE", "mix.exs", "README.md", "lib", "priv"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => @url_github}
    }
  end
end
