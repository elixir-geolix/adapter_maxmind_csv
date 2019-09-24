defmodule Geolix.Adapter.MaxMindCSVTest do
  use Geolix.Adapter.MaxMindCSV.RepoCase

  alias Geolix.Adapter.MaxMindCSV.Schema.ASNBlock
  alias Geolix.Adapter.MaxMindCSV.Schema.CityBlock
  alias Geolix.Adapter.MaxMindCSV.Schema.CountryBlock

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
      type: :asn
    }

    assert :ok == Geolix.load_database(database)
    assert result == Geolix.lookup({1, 1, 1, 1}, where: database[:id])
  end

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

  test "lookup :country" do
    result =
      Repo.insert!(%CountryBlock{
        network_lower: Decimal.new(16_843_008),
        network_upper: Decimal.new(16_843_263),
        geoname_id: 1,
        registered_country_geoname_id: 1,
        represented_country_geoname_id: 1,
        is_anonymous_proxy: false,
        is_satellite_provider: false
      })

    database = %{
      id: :csv_lookup_country,
      adapter: Geolix.Adapter.MaxMindCSV,
      type: :country
    }

    assert :ok == Geolix.load_database(database)
    assert result == Geolix.lookup({1, 1, 1, 1}, where: database[:id])
  end
end
