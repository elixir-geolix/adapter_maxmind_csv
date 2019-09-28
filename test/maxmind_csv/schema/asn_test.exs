defmodule Geolix.Adapter.MaxMindCSV.Schema.ASNTest do
  use Geolix.Adapter.MaxMindCSV.RepoCase

  alias Geolix.Adapter.MaxMindCSV.Schema.ASNBlock

  test "asn block" do
    assert {:ok, _} =
             Repo.insert(%ASNBlock{
               network_start_integer: 0,
               network_last_integer: 99,
               autonomous_system_number: 1,
               autonomous_system_organization: "test"
             })
  end
end
