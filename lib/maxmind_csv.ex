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

  import Ecto.Query, only: [where: 3]

  alias Geolix.Adapter.MaxMindCSV.IP
  alias Geolix.Adapter.MaxMindCSV.Repo
  alias Geolix.Adapter.MaxMindCSV.Schema.ASNBlock
  alias Geolix.Adapter.MaxMindCSV.Schema.CityBlock
  alias Geolix.Adapter.MaxMindCSV.Schema.CountryBlock

  @behaviour Geolix.Adapter

  @impl Geolix.Adapter

  def lookup(ip, _opts, %{type: :asn}), do: perform_lookup(ip, ASNBlock)
  def lookup(ip, _opts, %{type: :city}), do: perform_lookup(ip, CityBlock)
  def lookup(ip, _opts, %{type: :country}), do: perform_lookup(ip, CountryBlock)

  defp perform_lookup(ip, schema) do
    ip_integer = IP.to_integer(ip)

    schema
    |> where([b], b.network_lower <= ^ip_integer and b.network_upper >= ^ip_integer)
    |> Repo.one()
  end
end
