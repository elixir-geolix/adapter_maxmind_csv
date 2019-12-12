if Code.ensure_loaded?(EctoNetwork.CIDR) do
  defmodule Geolix.Adapter.MaxMindCSV.Schema.CityBlockCIDR do
    @moduledoc """
    Sample `Ecto.Schema` to use with the adapter for city databases (blocks).

    Table name: `geolix_maxmind_csv_city_blocks_cidr`.

    Preloads: `Geolix.Adapter.MaxMindCSV.Schema.CityLocation`
    """

    use Ecto.Schema

    import Ecto.Query, only: [preload: 2, where: 3]

    alias Geolix.Adapter.MaxMindCSV.Schema.CityLocation

    @behaviour Geolix.Adapter.MaxMindCSV.Block

    @primary_key false

    schema "geolix_maxmind_csv_city_blocks_cidr" do
      field :network, EctoNetwork.CIDR, primary_key: true
      field :geoname_id, :integer
      field :registered_country_geoname_id, :integer
      field :represented_country_geoname_id, :integer
      field :is_anonymous_proxy, :boolean
      field :is_satellite_provider, :boolean
      field :postal_code, :string
      field :latitude, :decimal
      field :longitude, :decimal
      field :accuracy_radius, :integer

      has_one :location, CityLocation,
        references: :geoname_id,
        foreign_key: :geoname_id

      has_one :location_registered, CityLocation,
        references: :registered_country_geoname_id,
        foreign_key: :geoname_id

      has_one :location_represented, CityLocation,
        references: :represented_country_geoname_id,
        foreign_key: :geoname_id
    end

    @impl Geolix.Adapter.MaxMindCSV.Block
    def find(ip, repo) do
      case EctoNetwork.CIDR.cast(ip) do
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
