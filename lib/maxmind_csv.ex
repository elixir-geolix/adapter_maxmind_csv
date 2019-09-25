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
            type: :city
          }
        ]
  """

  import Ecto.Query, only: [preload: 2, where: 3]

  alias Geolix.Adapter.MaxMindCSV.IP
  alias Geolix.Adapter.MaxMindCSV.Repo
  alias Geolix.Adapter.MaxMindCSV.Schema.ASNBlock
  alias Geolix.Adapter.MaxMindCSV.Schema.CityBlock
  alias Geolix.Adapter.MaxMindCSV.Schema.CountryBlock

  @preloads_asn []
  @preloads_city [:location, :location_registered, :location_represented]
  @preloads_country [:location]

  @behaviour Geolix.Adapter

  @impl Geolix.Adapter

  def lookup(ip, _opts, %{type: :asn}), do: perform_lookup(ip, ASNBlock, @preloads_asn)
  def lookup(ip, _opts, %{type: :city}), do: perform_lookup(ip, CityBlock, @preloads_city)

  def lookup(ip, _opts, %{type: :country}),
    do: perform_lookup(ip, CountryBlock, @preloads_country)

  defp perform_lookup(ip, schema, preloads) do
    ip_integer = IP.to_integer(ip)

    schema
    |> where([b], b.network_lower <= ^ip_integer and b.network_upper >= ^ip_integer)
    |> preload(^preloads)
    |> Repo.one()
  end
end
