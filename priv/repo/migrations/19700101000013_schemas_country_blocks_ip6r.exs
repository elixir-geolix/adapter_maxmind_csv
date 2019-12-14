defmodule Geolix.Adapter.MaxMindCSV.Repo.Migrations.SchemasCountryBlocksIP6R do
  use Ecto.Migration

  def change do
    create table("geolix_maxmind_csv_country_blocks_ip6r", primary_key: false) do
      add :network, :ip6r
      add :geoname_id, :integer
      add :registered_country_geoname_id, :integer
      add :represented_country_geoname_id, :integer
      add :is_anonymous_proxy, :boolean
      add :is_satellite_provider, :boolean
    end

    create index("geolix_maxmind_csv_country_blocks_ip6r", [:network], unique: true)
  end
end
