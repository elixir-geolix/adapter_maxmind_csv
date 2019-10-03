defmodule Geolix.Adapter.MaxMindCSV.Schema.ASNBlockDecimal do
  @moduledoc """
  Sample `Ecto.Schema` to use with the adapter for ASN databases.

  Table name: `geolix_maxmind_csv_asn_blocks_decimal`.
  """

  use Ecto.Schema

  import Ecto.Query, only: [where: 3]

  alias Geolix.Adapter.MaxMindCSV.IP

  @behaviour Geolix.Adapter.MaxMindCSV.Block

  @primary_key false

  schema "geolix_maxmind_csv_asn_blocks_decimal" do
    field :network_start_integer, :decimal, primary_key: true
    field :network_last_integer, :decimal, primary_key: true
    field :autonomous_system_number, :integer
    field :autonomous_system_organization, :string
  end

  @impl Geolix.Adapter.MaxMindCSV.Block
  def find(ip, repo) do
    ip_integer = IP.to_integer(ip)

    __MODULE__
    |> where(
      [b],
      b.network_start_integer <= ^ip_integer and b.network_last_integer >= ^ip_integer
    )
    |> repo.one()
  end
end
