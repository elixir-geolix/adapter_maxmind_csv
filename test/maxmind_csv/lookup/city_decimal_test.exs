defmodule Geolix.Adapter.MaxMindCSV.Lookup.CityDecimalTest do
  use Geolix.Adapter.MaxMindCSV.RepoCase

  alias Geolix.Adapter.MaxMindCSV.Repo
  alias Geolix.Adapter.MaxMindCSV.Schema.CityBlockDecimal
  alias Geolix.Adapter.MaxMindCSV.Schema.CityLocation

  test "lookup :city" do
    location =
      Repo.insert!(%CityLocation{
        geoname_id: 1,
        locale_code: "XX",
        continent_code: "XX",
        continent_name: "test",
        country_iso_code: "XX",
        country_name: "test",
        subdivision_1_iso_code: "XX",
        subdivision_1_name: "test",
        subdivision_2_iso_code: "XX",
        subdivision_2_name: "test",
        city_name: "test",
        metro_code: "test",
        time_zone: "test",
        is_in_european_union: false
      })

    location_registered =
      Repo.insert!(%CityLocation{
        geoname_id: 2,
        locale_code: "XX",
        continent_code: "XX",
        continent_name: "test",
        country_iso_code: "XX",
        country_name: "test",
        subdivision_1_iso_code: "XX",
        subdivision_1_name: "test",
        subdivision_2_iso_code: "XX",
        subdivision_2_name: "test",
        city_name: "test",
        metro_code: "test",
        time_zone: "test",
        is_in_european_union: false
      })

    location_represented =
      Repo.insert!(%CityLocation{
        geoname_id: 3,
        locale_code: "XX",
        continent_code: "XX",
        continent_name: "test",
        country_iso_code: "XX",
        country_name: "test",
        subdivision_1_iso_code: "XX",
        subdivision_1_name: "test",
        subdivision_2_iso_code: "XX",
        subdivision_2_name: "test",
        city_name: "test",
        metro_code: "test",
        time_zone: "test",
        is_in_european_union: false
      })

    result =
      Repo.insert!(%CityBlockDecimal{
        network_start_integer: Decimal.new(16_843_008),
        network_last_integer: Decimal.new(16_843_263),
        geoname_id: 1,
        registered_country_geoname_id: 2,
        represented_country_geoname_id: 3,
        is_anonymous_proxy: false,
        is_satellite_provider: false,
        postal_code: "12345",
        latitude: Decimal.from_float(0.123),
        longitude: Decimal.from_float(0.123),
        accuracy_radius: 100,
        location: location,
        location_registered: location_registered,
        location_represented: location_represented
      })

    database = %{
      id: :csv_lookup_city_decimal,
      adapter: Geolix.Adapter.MaxMindCSV,
      repo: Repo,
      schema: CityBlockDecimal
    }

    assert :ok == Geolix.load_database(database)
    assert result == Geolix.lookup({1, 1, 1, 1}, where: database[:id])
  end
end
