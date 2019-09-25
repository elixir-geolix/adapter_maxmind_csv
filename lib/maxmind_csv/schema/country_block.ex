defmodule Geolix.Adapter.MaxMindCSV.Schema.CountryBlock do
  @moduledoc false

  use Ecto.Schema

  alias Geolix.Adapter.MaxMindCSV.Schema.CountryLocation

  @primary_key false

  schema "geolix_maxmind_csv_country_blocks" do
    field :network_lower, :decimal, primary_key: true
    field :network_upper, :decimal, primary_key: true
    field :geoname_id, :integer
    field :registered_country_geoname_id, :integer
    field :represented_country_geoname_id, :integer
    field :is_anonymous_proxy, :boolean
    field :is_satellite_provider, :boolean

    has_one :location, CountryLocation,
      references: :geoname_id,
      foreign_key: :geoname_id
  end
end
