defmodule Geolix.Adapter.MaxMindCSV.Lookup.CountryTest do
  use Geolix.Adapter.MaxMindCSV.RepoCase

  alias Geolix.Adapter.MaxMindCSV.Schema.CountryBlock

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
