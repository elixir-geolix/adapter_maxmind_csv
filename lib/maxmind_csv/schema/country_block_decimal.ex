defmodule Geolix.Adapter.MaxMindCSV.Schema.CountryBlockDecimal do
  @moduledoc """
  Sample `Ecto.Schema` to use with the adapter for country databases (blocks).

  Table name: `geolix_maxmind_csv_country_blocks`.
  """

  use Ecto.Schema

  import Ecto.Query, only: [preload: 2, where: 3]

  alias Geolix.Adapter.MaxMindCSV.IP
  alias Geolix.Adapter.MaxMindCSV.Schema.CountryLocation

  @behaviour Geolix.Adapter.MaxMindCSV.Block

  @primary_key false

  schema "geolix_maxmind_csv_country_blocks_decimal" do
    field :network_start_integer, :decimal, primary_key: true
    field :network_last_integer, :decimal, primary_key: true
    field :geoname_id, :integer
    field :registered_country_geoname_id, :integer
    field :represented_country_geoname_id, :integer
    field :is_anonymous_proxy, :boolean
    field :is_satellite_provider, :boolean

    has_one :location, CountryLocation,
      references: :geoname_id,
      foreign_key: :geoname_id

    has_one :location_registered, CountryLocation,
      references: :registered_country_geoname_id,
      foreign_key: :geoname_id

    has_one :location_represented, CountryLocation,
      references: :represented_country_geoname_id,
      foreign_key: :geoname_id
  end

  @impl Geolix.Adapter.MaxMindCSV.Block
  def find(ip, repo, preloads) do
    ip_integer = IP.to_integer(ip)

    __MODULE__
    |> where(
      [b],
      b.network_start_integer <= ^ip_integer and b.network_last_integer >= ^ip_integer
    )
    |> preload(^preloads)
    |> repo.one()
  end
end
