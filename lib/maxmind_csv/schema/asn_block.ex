defmodule Geolix.Adapter.MaxMindCSV.Schema.ASNBlock do
  @moduledoc false

  use Ecto.Schema

  schema "geolix_maxmind_csv_asn_blocks" do
    field :network_lower, :decimal
    field :network_upper, :decimal
    field :autonomous_system_number, :integer
    field :autonomous_system_organization, :string
  end
end
