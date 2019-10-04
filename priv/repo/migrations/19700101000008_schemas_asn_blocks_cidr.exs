defmodule Geolix.Adapter.MaxMindCSV.Repo.Migrations.SchemasASNBlocksCIDR do
  use Ecto.Migration

  def change do
    create table("geolix_maxmind_csv_asn_blocks_cidr", primary_key: false) do
      add :network, :cidr
      add :autonomous_system_number, :integer
      add :autonomous_system_organization, :string
    end

    create index("geolix_maxmind_csv_asn_blocks_cidr", [:network], unique: true)
  end
end
