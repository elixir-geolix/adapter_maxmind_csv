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
            adapter: Geolix.Adapter.MaxMindCSV
            repo: Geolix.Adapter.MaxMindCSV.Repo,
            schema: Geolix.Adapter.MaxMindCSV.Schema.CityBlockDecimal,
            preloads: [:location, :location_registered, :location_represented]
          }
        ]

  ### Adapter Repo

  With the configuration key `:repo` you can define which `Ecto.Repo` should
  be used for the database access.

  The module `Geolix.Adapter.MaxMindCSV.Repo` can be used if you define the
  database connection for `otp_app: :geolix_adapter_maxmind_csv` and hook it
  into your supervision tree.

  ### Adapter Schemas (and Preloads)

  The configuration keys `:schema` and `:preloads` define the database result
  to fetch for an IP result.

  The following schemas are provided but should be replaced with your own if
  you have custom requirements for the underlying database structure:

  - `Geolix.Adapter.MaxMindCSV.Schema.ASNBlockDecimal`
    - no preloads
  - `Geolix.Adapter.MaxMindCSV.Schema.CityBlockDecimal`
    - preloads: `[:location, :location_registered, :location_represented]`
  - `Geolix.Adapter.MaxMindCSV.Schema.CountryBlockDecimal`
    - preloads: `[:location, :location_registered, :location_represented]`

  If you use a custom schema you have to include two fields:

  - `network_start_integer`
  - `network_last_integer`

  For IPv4 entries both fields are used with 32-bit integers, 128-bit for IPv6.

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

  import Ecto.Query, only: [preload: 2, where: 3]

  alias Geolix.Adapter.MaxMindCSV.IP

  @behaviour Geolix.Adapter

  @impl Geolix.Adapter
  def lookup(ip, _opts, %{repo: repo, schema: schema, preloads: preloads}) do
    ip_integer = IP.to_integer(ip)

    schema
    |> where(
      [b],
      b.network_start_integer <= ^ip_integer and b.network_last_integer >= ^ip_integer
    )
    |> preload(^preloads)
    |> repo.one()
  end
end
