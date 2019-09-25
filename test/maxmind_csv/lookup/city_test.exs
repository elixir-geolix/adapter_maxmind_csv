defmodule Geolix.Adapter.MaxMindCSV.Lookup.CityTest do
  use Geolix.Adapter.MaxMindCSV.RepoCase

  alias Geolix.Adapter.MaxMindCSV.Schema.CityBlock

  test "lookup :city" do
    result =
      Repo.insert!(%CityBlock{
        network_lower: Decimal.new(16_843_008),
        network_upper: Decimal.new(16_843_263),
        geoname_id: 1,
        registered_country_geoname_id: 1,
        represented_country_geoname_id: 1,
        is_anonymous_proxy: false,
        is_satellite_provider: false,
        postal_code: "12345",
        latitude: Decimal.from_float(0.123),
        longitude: Decimal.from_float(0.123),
        accuracy_radius: 100
      })

    database = %{
      id: :csv_lookup_city,
      adapter: Geolix.Adapter.MaxMindCSV,
      type: :city
    }

    assert :ok == Geolix.load_database(database)
    assert result == Geolix.lookup({1, 1, 1, 1}, where: database[:id])
  end
end
