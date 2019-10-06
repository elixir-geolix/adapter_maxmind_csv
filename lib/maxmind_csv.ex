defmodule Geolix.Adapter.MaxMindCSV do
  @moduledoc """
  Adapter for Geolix to work with MaxMind CSV databases.

  ## Adapter Configuration

  To start using the adapter with a compatible database you need to add the
  required configuration entry to your `:geolix` configuration:

      config :geolix,
        databases: [
          %{
            id: :my_csv_database,
            adapter: Geolix.Adapter.MaxMindCSV,
            repo: Geolix.Adapter.MaxMindCSV.Repo,
            schema: Geolix.Adapter.MaxMindCSV.Schema.CityBlockDecimal
          }
        ]

  ### Adapter Repo

  With the configuration key `:repo` you can define which `Ecto.Repo` should
  be used for the database access.

  The module `Geolix.Adapter.MaxMindCSV.Repo` can be used if you define the
  database connection for `otp_app: :geolix_adapter_maxmind_csv` and hook it
  into your supervision tree.

  ### Adapter Schemas

  The configuration key `:schema` define the database result to
  fetch for an IP result.

  The following schemas are provided but should be replaced with your own if
  you have custom requirements for the underlying database structure:

  - `Geolix.Adapter.MaxMindCSV.Schema.ASNBlockDecimal`
  - `Geolix.Adapter.MaxMindCSV.Schema.CityBlockDecimal`
  - `Geolix.Adapter.MaxMindCSV.Schema.CountryBlockDecimal`

  If you use a custom schema you need to implement the
  `Geolix.Adapter.MaxMindCSV.Block` behaviour.

  #### Adapter Schema Migrations

  When using the packaged schemas you need to create the underlying tables
  accordingly. Working migrations you can copy to your project can be found in
  the directory `priv/repo/migrations` of the downloaded dependency.

  ## Adapter Database

  The database lookups are done using an integer representation of the
  requested IP.

  To use the official MaxMind CSV databases you ned to convert them to include
  this network integer using the
  [GeoIP2 CSV Format Converter](https://github.com/maxmind/geoip2-csv-converter)
  with the parameter `-include-integer-range`.
  """

  @behaviour Geolix.Adapter

  @impl Geolix.Adapter
  def lookup(ip, _opts, %{repo: repo, schema: schema}), do: schema.find(ip, repo)
end
