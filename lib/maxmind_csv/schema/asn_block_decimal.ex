defmodule Geolix.Adapter.MaxMindCSV.Schema.ASNBlockDecimal do
  @moduledoc """
  Sample `Ecto.Schema` to use with the adapter for ASN databases.

  Table name: `geolix_maxmind_csv_asn_blocks_decimal`.
  """

  use Ecto.Schema

  @primary_key false

  schema "geolix_maxmind_csv_asn_blocks_decimal" do
    field :network_start_integer, :decimal, primary_key: true
    field :network_last_integer, :decimal, primary_key: true
    field :autonomous_system_number, :integer
    field :autonomous_system_organization, :string
  end
end
