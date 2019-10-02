defmodule Geolix.Adapter.MaxMindCSV.Repo.Migrations.SchemasCityBlocks do
  use Ecto.Migration

  def change do
    create table("geolix_maxmind_csv_city_blocks", primary_key: false) do
      add :network_start_integer, :decimal
      add :network_last_integer, :decimal
      add :geoname_id, :integer
      add :registered_country_geoname_id, :integer
      add :represented_country_geoname_id, :integer
      add :is_anonymous_proxy, :boolean
      add :is_satellite_provider, :boolean
      add :postal_code, :string
      add :latitude, :decimal
      add :longitude, :decimal
      add :accuracy_radius, :integer
    end

    create index(
             "geolix_maxmind_csv_city_blocks",
             [:network_start_integer, :network_last_integer],
             unique: true
           )
  end
end
