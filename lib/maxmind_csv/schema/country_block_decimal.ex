defmodule Geolix.Adapter.MaxMindCSV.Schema.CountryBlockDecimal do
  @moduledoc """
  Sample `Ecto.Schema` to use with the adapter for country databases (blocks).

  Table name: `geolix_maxmind_csv_country_blocks`.
  """

  use Ecto.Schema

  alias Geolix.Adapter.MaxMindCSV.Schema.CountryLocation

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
end
