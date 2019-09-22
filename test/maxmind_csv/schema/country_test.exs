defmodule Geolix.Adapter.MaxMindCSV.Schema.CountryTest do
  use Geolix.Adapter.MaxMindCSV.RepoCase

  alias Geolix.Adapter.MaxMindCSV.Schema.CountryBlock
  alias Geolix.Adapter.MaxMindCSV.Schema.CountryLocation

  test "country block" do
    assert {:ok, _} =
             Repo.insert(%CountryBlock{
               network_lower: 0,
               network_upper: 99,
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
