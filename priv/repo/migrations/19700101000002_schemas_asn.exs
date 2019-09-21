defmodule Geolix.Adapter.MaxMindCSV.Repo.Migrations.SchemasASN do
  use Ecto.Migration

  def change do
    create table("geolix_maxmind_csv_asn_blocks", primary_key: false) do
      add :network_lower, :decimal
      add :network_upper, :decimal
      add :autonomous_system_number, :integer
      add :autonomous_system_organization, :string
    end

    create index("geolix_maxmind_csv_asn_blocks", [:network_lower, :network_upper], unique: true)
  end
end
