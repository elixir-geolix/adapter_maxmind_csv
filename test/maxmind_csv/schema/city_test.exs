defmodule Geolix.Adapter.MaxMindCSV.Schema.CityTest do
  use Geolix.Adapter.MaxMindCSV.RepoCase

  alias Geolix.Adapter.MaxMindCSV.Schema.CityBlockDecimal
  alias Geolix.Adapter.MaxMindCSV.Schema.CityLocation

  test "city block decimal" do
    assert {:ok, _} =
             Repo.insert(%CityBlockDecimal{
               network_start_integer: 0,
               network_last_integer: 99,
               geoname_id: 1,
               registered_country_geoname_id: 1,
               represented_country_geoname_id: 1,
               is_anonymous_proxy: false,
               is_satellite_provider: false,
               postal_code: "12345",
               latitude: 0.123,
               longitude: 0.123,
               accuracy_radius: 100
             })
  end

  test "city location" do
    assert {:ok, _} =
             Repo.insert(%CityLocation{
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
  end
end
