defmodule Geolix.Adapter.MaxMindCSV.Schema.CityLocation do
  @moduledoc """
  Sample `Ecto.Schema` to use with the adapter for city databases (locations).

  Table name: `geolix_maxmind_csv_city_locations`.
  """

  use Ecto.Schema

  @primary_key false

  schema "geolix_maxmind_csv_city_locations" do
    field :geoname_id, :integer, primary_key: true
    field :locale_code, :string
    field :continent_code, :string
    field :continent_name, :string
    field :country_iso_code, :string
    field :country_name, :string
    field :subdivision_1_iso_code, :string
    field :subdivision_1_name, :string
    field :subdivision_2_iso_code, :string
    field :subdivision_2_name, :string
    field :city_name, :string
    field :metro_code, :string
    field :time_zone, :string
    field :is_in_european_union, :boolean
  end
end
