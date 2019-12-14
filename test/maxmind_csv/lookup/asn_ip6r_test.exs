defmodule Geolix.Adapter.MaxMindCSV.Lookup.ASNIP6RTest do
  use Geolix.Adapter.MaxMindCSV.RepoCase

  alias Geolix.Adapter.MaxMindCSV.Repo
  alias Geolix.Adapter.MaxMindCSV.Schema.ASNBlockIP6R

  test "lookup :asn" do
    result =
      Repo.insert!(%ASNBlockIP6R{
        network: %EctoIPRange.IP6R{
          first_ip: {1, 2, 3, 4, 5, 6, 7, 8},
          last_ip: {2, 3, 4, 5, 6, 7, 8, 9},
          range: "1:2:3:4:5:6:7:8-2:3:4:5:6:7:8:9"
        },
        autonomous_system_number: 1,
        autonomous_system_organization: "test"
      })

    database = %{
      id: :csv_lookup_asn_ip6r,
      adapter: Geolix.Adapter.MaxMindCSV,
      repo: Repo,
      schema: ASNBlockIP6R
    }

    assert :ok == Geolix.load_database(database)
    assert result == Geolix.lookup({1, 3, 5, 7, 0, 0, 0, 0}, where: database[:id])
  end
end
