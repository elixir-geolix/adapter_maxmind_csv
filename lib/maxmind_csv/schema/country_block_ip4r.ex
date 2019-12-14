if Code.ensure_loaded?(EctoIPRange.IP4R) do
  defmodule Geolix.Adapter.MaxMindCSV.Schema.CountryBlockIP4R do
    @moduledoc """
    Sample `Ecto.Schema` to use with the adapter for country databases (blocks).

    Table name: `geolix_maxmind_csv_country_blocks`.

    Preloads: `Geolix.Adapter.MaxMindCSV.Schema.CountryLocation`
    """

    use Ecto.Schema

    import Ecto.Query, only: [preload: 2, where: 3]

    alias Geolix.Adapter.MaxMindCSV.Schema.CountryLocation

    @behaviour Geolix.Adapter.MaxMindCSV.Block

    @primary_key false

    schema "geolix_maxmind_csv_country_blocks_ip4r" do
      field :network, EctoIPRange.IP4R, primary_key: true
      field :geoname_id, :integer
      field :registered_country_geoname_id, :integer
      field :represented_country_geoname_id, :integer
      field :is_anonymous_proxy, :boolean
      field :is_satellite_provider, :boolean

      has_one :location, CountryLocation,
        references: :geoname_id,
        foreign_key: :geoname_id

      has_one :location_registered, CountryLocation,
        references: :registered_country_geoname_id,
        foreign_key: :geoname_id

      has_one :location_represented, CountryLocation,
        references: :represented_country_geoname_id,
        foreign_key: :geoname_id
    end

    @impl Geolix.Adapter.MaxMindCSV.Block
    def find(ip, repo) do
      case EctoIPRange.IP4R.cast(ip) do
        {:ok, ip_casted} ->
          __MODULE__
          |> where([], fragment("network >>= ?", ^ip_casted))
          |> preload([:location, :location_registered, :location_represented])
          |> repo.one()

        _ ->
          nil
      end
    end
  end
end
