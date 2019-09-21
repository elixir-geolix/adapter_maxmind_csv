defmodule Geolix.Adapter.MaxMindCSV.Schema.CountryLocation do
  @moduledoc false

  use Ecto.Schema

  @primary_key false

  schema "geolix_maxmind_csv_country_locations" do
    field :geoname_id, :integer, primary_key: true
    field :locale_code, :string
    field :continent_code, :string
    field :continent_name, :string
    field :country_iso_code, :string
    field :country_name, :string
    field :is_in_european_union, :boolean
  end
end
