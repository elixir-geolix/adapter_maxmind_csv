defmodule Geolix.Adapter.MaxMindCSV.Lookup.ASNDecimalTest do
  use Geolix.Adapter.MaxMindCSV.RepoCase

  alias Geolix.Adapter.MaxMindCSV.Repo
  alias Geolix.Adapter.MaxMindCSV.Schema.ASNBlockDecimal

  test "lookup :asn" do
    result =
      Repo.insert!(%ASNBlockDecimal{
        network_start_integer: Decimal.new(16_843_008),
        network_last_integer: Decimal.new(16_843_263),
        autonomous_system_number: 1,
        autonomous_system_organization: "test"
      })

    database = %{
      id: :csv_lookup_asn_decimal,
      adapter: Geolix.Adapter.MaxMindCSV,
      repo: Repo,
      schema: ASNBlockDecimal
    }

    assert :ok == Geolix.load_database(database)
    assert result == Geolix.lookup({1, 1, 1, 1}, where: database[:id])
  end
end
