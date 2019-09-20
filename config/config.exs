use Mix.Config

if Mix.env() == :test do
  alias Geolix.Adapter.MaxMindCSV.Repo

  config :geolix_adapter_maxmind_csv, ecto_repos: [Repo]

  config :geolix_adapter_maxmind_csv, Repo,
    username: "postgres",
    password: "postgres",
    database: "geolix_adapter_maxmind_csv",
    hostname: "localhost",
    pool: Ecto.Adapters.SQL.Sandbox
end
