defmodule Geolix.Adapter.MaxMindCSV.Lookup.ASNTest do
  use Geolix.Adapter.MaxMindCSV.RepoCase

  alias Geolix.Adapter.MaxMindCSV.Schema.ASNBlock

  test "lookup :asn" do
    result =
      Repo.insert!(%ASNBlock{
        network_lower: Decimal.new(16_843_008),
        network_upper: Decimal.new(16_843_263),
        autonomous_system_number: 1,
        autonomous_system_organization: "test"
      })

    database = %{
      id: :csv_lookup_asn,
      adapter: Geolix.Adapter.MaxMindCSV,
      repo: Geolix.Adapter.MaxMindCSV.Repo,
      schema: Geolix.Adapter.MaxMindCSV.Schema.ASNBlock,
      preloads: []
    }

    assert :ok == Geolix.load_database(database)
    assert result == Geolix.lookup({1, 1, 1, 1}, where: database[:id])
  end
end
