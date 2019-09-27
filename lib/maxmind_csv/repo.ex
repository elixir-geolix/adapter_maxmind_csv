defmodule Geolix.Adapter.MaxMindCSV.Repo do
  @moduledoc """
  Sample `Ecto.Repo` to use with the adapter.

  You should replace this module with your own.

  Configured using `otp_app: :geolix_adapter_maxmind_csv`.
  """

  use Ecto.Repo,
    otp_app: :geolix_adapter_maxmind_csv,
    adapter: Ecto.Adapters.Postgres
end
