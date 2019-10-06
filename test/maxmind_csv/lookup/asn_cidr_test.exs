defmodule Geolix.Adapter.MaxMindCSV.Lookup.ASNCIDRTest do
  use Geolix.Adapter.MaxMindCSV.RepoCase

  alias Geolix.Adapter.MaxMindCSV.Repo
  alias Geolix.Adapter.MaxMindCSV.Schema.ASNBlockCIDR

  test "lookup :asn" do
    result =
      Repo.insert!(%ASNBlockCIDR{
        network: %Postgrex.INET{address: {1, 1, 1, 0}, netmask: 24},
        autonomous_system_number: 1,
        autonomous_system_organization: "test"
      })

    database = %{
      id: :csv_lookup_asn_cidr,
      adapter: Geolix.Adapter.MaxMindCSV,
      repo: Repo,
      schema: ASNBlockCIDR
    }

    assert :ok == Geolix.load_database(database)
    assert result == Geolix.lookup({1, 1, 1, 1}, where: database[:id])
  end
end
