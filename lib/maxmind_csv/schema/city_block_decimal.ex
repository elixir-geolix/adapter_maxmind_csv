defmodule Geolix.Adapter.MaxMindCSV.Schema.CityBlockDecimal do
  @moduledoc """
  Sample `Ecto.Schema` to use with the adapter for city databases (blocks).

  Table name: `geolix_maxmind_csv_city_blocks_decimal`.
  """

  use Ecto.Schema

  import Ecto.Query, only: [preload: 2, where: 3]

  alias Geolix.Adapter.MaxMindCSV.IP
  alias Geolix.Adapter.MaxMindCSV.Schema.CityLocation

  @behaviour Geolix.Adapter.MaxMindCSV.Block

  @primary_key false

  schema "geolix_maxmind_csv_city_blocks_decimal" do
    field :network_start_integer, :decimal, primary_key: true
    field :network_last_integer, :decimal, primary_key: true
    field :geoname_id, :integer
    field :registered_country_geoname_id, :integer
    field :represented_country_geoname_id, :integer
    field :is_anonymous_proxy, :boolean
    field :is_satellite_provider, :boolean
    field :postal_code, :string
    field :latitude, :decimal
    field :longitude, :decimal
    field :accuracy_radius, :integer

    has_one :location, CityLocation,
      references: :geoname_id,
      foreign_key: :geoname_id

    has_one :location_registered, CityLocation,
      references: :registered_country_geoname_id,
      foreign_key: :geoname_id

    has_one :location_represented, CityLocation,
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
