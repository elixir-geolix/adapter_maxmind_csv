defmodule Geolix.Adapter.MaxMindCSV.Repo.Migrations.SchemasASNBlocksIP4R do
  use Ecto.Migration

  def change do
    create table("geolix_maxmind_csv_asn_blocks_ip4r", primary_key: false) do
      add :network, :ip4r
      add :autonomous_system_number, :integer
      add :autonomous_system_organization, :string
    end

    create index("geolix_maxmind_csv_asn_blocks_ip4r", [:network], unique: true)
  end
end
