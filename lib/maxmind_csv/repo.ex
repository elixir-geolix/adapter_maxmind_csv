defmodule Geolix.Adapter.MaxMindCSV.Repo do
  use Ecto.Repo,
    otp_app: :geolix_adapter_maxmind_csv,
    adapter: Ecto.Adapters.Postgres
end
