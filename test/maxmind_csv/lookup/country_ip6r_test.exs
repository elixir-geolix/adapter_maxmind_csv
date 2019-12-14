defmodule Geolix.Adapter.MaxMindCSV.Lookup.CountryIP6RTest do
  use Geolix.Adapter.MaxMindCSV.RepoCase

  alias Geolix.Adapter.MaxMindCSV.Repo
  alias Geolix.Adapter.MaxMindCSV.Schema.CountryBlockIP6R
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
      Repo.insert!(%CountryBlockIP6R{
        network: %EctoIPRange.IP6R{
          first_ip: {1, 2, 3, 4, 5, 6, 7, 8},
          last_ip: {2, 3, 4, 5, 6, 7, 8, 9},
          range: "1:2:3:4:5:6:7:8-2:3:4:5:6:7:8:9"
        },
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
      id: :csv_lookup_country_ip6r,
      adapter: Geolix.Adapter.MaxMindCSV,
      repo: Repo,
      schema: CountryBlockIP6R
    }

    assert :ok == Geolix.load_database(database)
    assert result == Geolix.lookup({1, 3, 5, 7, 0, 0, 0, 0}, where: database[:id])
  end
end
