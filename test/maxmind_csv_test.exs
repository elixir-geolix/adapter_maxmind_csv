defmodule Geolix.Adapter.MaxMindCSVTest do
  use ExUnit.Case

  test "lookup" do
    database = %{
      id: :csv_lookup,
      adapter: Geolix.Adapter.MaxMindCSV
    }

    assert :ok == Geolix.load_database(database)
    assert nil == Geolix.lookup({1, 1, 1, 1}, where: database[:id])
  end
end
