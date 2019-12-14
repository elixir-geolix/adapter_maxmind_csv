defmodule Geolix.Adapter.MaxMindCSV.Lookup.ASNIP4RTest do
  use Geolix.Adapter.MaxMindCSV.RepoCase

  alias Geolix.Adapter.MaxMindCSV.Repo
  alias Geolix.Adapter.MaxMindCSV.Schema.ASNBlockIP4R

  test "lookup :asn" do
    result =
      Repo.insert!(%ASNBlockIP4R{
        network: %EctoIPRange.IP4R{
          first_ip: {1, 1, 1, 0},
          last_ip: {1, 1, 1, 255},
          range: "1.1.1.0-1.1.1.255"
        },
        autonomous_system_number: 1,
        autonomous_system_organization: "test"
      })

    database = %{
      id: :csv_lookup_asn_ip4r,
      adapter: Geolix.Adapter.MaxMindCSV,
      repo: Repo,
      schema: ASNBlockIP4R
    }

    assert :ok == Geolix.load_database(database)
    assert result == Geolix.lookup({1, 1, 1, 1}, where: database[:id])
  end
end
