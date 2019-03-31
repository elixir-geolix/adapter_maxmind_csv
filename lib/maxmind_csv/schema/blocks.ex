defmodule Geolix.Adapter.MaxMindCSV.Schema.Blocks do
  @moduledoc false

  use Ecto.Schema

  schema "geolix_maxmind_csv_blocks" do
    field(:network_lower, :decimal)
    field(:network_upper, :decimal)
    field(:geoname_id, :integer)
    field(:registered_country_geoname_id, :integer)
    field(:represented_country_geoname_id, :integer)
    field(:postal_code, :string)
    field(:latitude, :decimal)
    field(:longitude, :decimal)
    field(:accuracy_radius, :integer)
  end
end
