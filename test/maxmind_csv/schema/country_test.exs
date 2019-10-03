defmodule Geolix.Adapter.MaxMindCSV.Schema.CountryTest do
  use Geolix.Adapter.MaxMindCSV.RepoCase

  alias Geolix.Adapter.MaxMindCSV.Schema.CountryBlockDecimal
  alias Geolix.Adapter.MaxMindCSV.Schema.CountryLocation

  test "country block decimal" do
    assert {:ok, _} =
             Repo.insert(%CountryBlockDecimal{
               network_start_integer: 0,
               network_last_integer: 99,
               geoname_id: 1,
               registered_country_geoname_id: 1,
               represented_country_geoname_id: 1,
               is_anonymous_proxy: false,
               is_satellite_provider: false
             })
  end

  test "country location" do
    assert {:ok, _} =
             Repo.insert(%CountryLocation{
               geoname_id: 1,
               locale_code: "XX",
               continent_code: "XX",
               continent_name: "test",
               country_iso_code: "XX",
               country_name: "test",
               is_in_european_union: false
             })
  end
end
