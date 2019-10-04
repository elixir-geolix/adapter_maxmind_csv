defmodule Geolix.Adapter.MaxMindCSV.Repo.Migrations.SchemasCountryBlocksCIDR do
  use Ecto.Migration

  def change do
    create table("geolix_maxmind_csv_country_blocks_cidr", primary_key: false) do
      add :network, :cidr
      add :geoname_id, :integer
      add :registered_country_geoname_id, :integer
      add :represented_country_geoname_id, :integer
      add :is_anonymous_proxy, :boolean
      add :is_satellite_provider, :boolean
    end

    create index("geolix_maxmind_csv_country_blocks_cidr", [:network], unique: true)
  end
end
