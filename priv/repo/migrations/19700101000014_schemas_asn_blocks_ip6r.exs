defmodule Geolix.Adapter.MaxMindCSV.Repo.Migrations.SchemasASNBlocksIP6R do
  use Ecto.Migration

  def change do
    create table("geolix_maxmind_csv_asn_blocks_ip6r", primary_key: false) do
      add :network, :ip6r
      add :autonomous_system_number, :integer
      add :autonomous_system_organization, :string
    end

    create index("geolix_maxmind_csv_asn_blocks_ip6r", [:network], unique: true)
  end
end
