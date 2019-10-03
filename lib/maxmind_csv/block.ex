defmodule Geolix.Adapter.MaxMindCSV.Block do
  @moduledoc """
  Behaviour definition any "block" schema should adhere to.
  """

  @doc """
  Retrieve the dataset for an IP if available.
  """
  @callback find(ip :: :inet.ip_address(), repo :: Ecto.Repo.t()) :: map | nil
end
