alias Geolix.Adapter.MaxMindCSV.Repo

Repo.start_link()

ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Repo, :manual)
