if Code.ensure_loaded?(EctoIPRange.IP6R) do
  defmodule Geolix.Adapter.MaxMindCSV.Schema.ASNBlockIP6R do
    @moduledoc """
    Sample `Ecto.Schema` to use with the adapter for ASN databases.

    Table name: `geolix_maxmind_csv_asn_blocks_ip6r`.
    """

    use Ecto.Schema

    import Ecto.Query, only: [where: 3]

    @behaviour Geolix.Adapter.MaxMindCSV.Block

    @primary_key false

    schema "geolix_maxmind_csv_asn_blocks_ip6r" do
      field :network, EctoIPRange.IP6R, primary_key: true
      field :autonomous_system_number, :integer
      field :autonomous_system_organization, :string
    end

    @impl Geolix.Adapter.MaxMindCSV.Block
    def find(ip, repo) do
      case EctoIPRange.IP6R.cast(ip) do
        {:ok, ip_casted} ->
          __MODULE__
          |> where([], fragment("network >>= ?", ^ip_casted))
          |> repo.one()

        _ ->
          nil
      end
    end
  end
end
