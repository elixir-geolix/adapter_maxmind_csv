defmodule Geolix.Adapter.MaxMindCSV.Repo.Migrations.SchemasASNBlocksDecimal do
  use Ecto.Migration

  def change do
    create table("geolix_maxmind_csv_asn_blocks_decimal", primary_key: false) do
      add :network_start_integer, :decimal
      add :network_last_integer, :decimal
      add :autonomous_system_number, :integer
      add :autonomous_system_organization, :string
    end

    create index(
             "geolix_maxmind_csv_asn_blocks_decimal",
             [:network_start_integer, :network_last_integer],
             unique: true
           )
  end
end
