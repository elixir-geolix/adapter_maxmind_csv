defmodule Geolix.Adapter.MaxMindCSV.Lookup.CountryTest do
  use Geolix.Adapter.MaxMindCSV.RepoCase

  alias Geolix.Adapter.MaxMindCSV.Schema.CountryBlock
  alias Geolix.Adapter.MaxMindCSV.Schema.CountryLocation

  test "lookup :country" do
    location =
      Repo.insert!(%CountryLocation{
        geoname_id: 1,
        locale_code: "XX",
        continent_code: "XX",
        continent_name: "test",
        country_iso_code: "XX",
        country_name: "test",
        is_in_european_union: false
      })

    location_registered =
      Repo.insert!(%CountryLocation{
        geoname_id: 2,
        locale_code: "XX",
        continent_code: "XX",
        continent_name: "test",
        country_iso_code: "XX",
        country_name: "test",
        is_in_european_union: false
      })

    location_represented =
      Repo.insert!(%CountryLocation{
        geoname_id: 3,
        locale_code: "XX",
        continent_code: "XX",
        continent_name: "test",
        country_iso_code: "XX",
        country_name: "test",
        is_in_european_union: false
      })

    result =
      Repo.insert!(%CountryBlock{
        network_start_integer: Decimal.new(16_843_008),
        network_last_integer: Decimal.new(16_843_263),
        geoname_id: 1,
        registered_country_geoname_id: 2,
        represented_country_geoname_id: 3,
        is_anonymous_proxy: false,
        is_satellite_provider: false,
        location: location,
        location_registered: location_registered,
        location_represented: location_represented
      })

    database = %{
      id: :csv_lookup_country,
      adapter: Geolix.Adapter.MaxMindCSV,
      repo: Geolix.Adapter.MaxMindCSV.Repo,
      schema: Geolix.Adapter.MaxMindCSV.Schema.CountryBlock,
      preloads: [:location, :location_represented, :location_registered]
    }

    assert :ok == Geolix.load_database(database)
    assert result == Geolix.lookup({1, 1, 1, 1}, where: database[:id])
  end
end
