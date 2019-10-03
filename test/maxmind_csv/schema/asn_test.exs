defmodule Geolix.Adapter.MaxMindCSV.Schema.ASNTest do
  use Geolix.Adapter.MaxMindCSV.RepoCase

  alias Geolix.Adapter.MaxMindCSV.Schema.ASNBlockDecimal

  test "asn block decimal" do
    assert {:ok, _} =
             Repo.insert(%ASNBlockDecimal{
               network_start_integer: 0,
               network_last_integer: 99,
               autonomous_system_number: 1,
               autonomous_system_organization: "test"
             })
  end
end
