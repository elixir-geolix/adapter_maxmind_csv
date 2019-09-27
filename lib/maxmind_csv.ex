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
            schema: Geolix.Adapter.MaxMindCSV.Schema.CityBlock,
            preloads: [:location, :location_registered, :location_represented]
          }
        ]

  ### Adapter Repo

  With the configuration key `:repo` you can define which `Ecto.Repo` should
  be used for the database access.

  The module `Geolix.Adapter.MaxMindCSV.Repo` can be used if you define the
  database connection for `otp_app: :geolix_adapter_maxmind_csv` and hook it
  into your supervision tree.
  """

  import Ecto.Query, only: [preload: 2, where: 3]

  alias Geolix.Adapter.MaxMindCSV.IP

  @behaviour Geolix.Adapter

  @impl Geolix.Adapter
  def lookup(ip, _opts, %{repo: repo, schema: schema, preloads: preloads}) do
    ip_integer = IP.to_integer(ip)

    schema
    |> where([b], b.network_lower <= ^ip_integer and b.network_upper >= ^ip_integer)
    |> preload(^preloads)
    |> repo.one()
  end
end
