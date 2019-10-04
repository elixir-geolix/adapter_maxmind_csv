if Code.ensure_loaded?(EctoNetwork.CIDR) do
  defmodule Geolix.Adapter.MaxMindCSV.Schema.ASNBlockCIDR do
    @moduledoc """
    Sample `Ecto.Schema` to use with the adapter for ASN databases.

    Table name: `geolix_maxmind_csv_asn_blocks_cidr`.
    """

    use Ecto.Schema

    import Ecto.Query, only: [where: 3]

    @behaviour Geolix.Adapter.MaxMindCSV.Block

    @primary_key false

    schema "geolix_maxmind_csv_asn_blocks_cidr" do
      field :network, EctoNetwork.CIDR, primary_key: true
      field :autonomous_system_number, :integer
      field :autonomous_system_organization, :string
    end

    @impl Geolix.Adapter.MaxMindCSV.Block
    def find(ip, repo) do
      case EctoNetwork.CIDR.cast(ip) do
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
