defmodule Geolix.Adapter.MaxMindCSV.Repo.Migrations.IP4RExtension do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS ip4r"
  end
end
