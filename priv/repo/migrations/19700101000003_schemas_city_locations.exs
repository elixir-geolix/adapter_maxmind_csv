defmodule Geolix.Adapter.MaxMindCSV.Repo.Migrations.SchemasCityLocations do
  use Ecto.Migration

  def change do
    create table("geolix_maxmind_csv_city_locations", primary_key: false) do
      add :geoname_id, :integer
      add :locale_code, :string
      add :continent_code, :string
      add :continent_name, :string
      add :country_iso_code, :string
      add :country_name, :string
      add :subdivision_1_iso_code, :string
      add :subdivision_1_name, :string
      add :subdivision_2_iso_code, :string
      add :subdivision_2_name, :string
      add :city_name, :string
      add :metro_code, :string
      add :time_zone, :string
      add :is_in_european_union, :boolean
    end

    create index("geolix_maxmind_csv_city_locations", [:geoname_id], unique: true)
  end
end
