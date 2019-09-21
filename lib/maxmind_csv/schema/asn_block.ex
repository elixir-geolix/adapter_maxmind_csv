defmodule Geolix.Adapter.MaxMindCSV.Schema.ASNBlock do
  @moduledoc false

  use Ecto.Schema

  @primary_key false

  schema "geolix_maxmind_csv_asn_blocks" do
    field :network_lower, :decimal, primary_key: true
    field :network_upper, :decimal, primary_key: true
    field :autonomous_system_number, :integer
    field :autonomous_system_organization, :string
  end
end
