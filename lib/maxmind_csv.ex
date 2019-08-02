defmodule Geolix.Adapter.MaxMindCSV do
  @moduledoc """
  Adapter for Geolix to work with MaxMind CSV databases.

  ## Adapter Configuration

  To start using the adapter with a compatible database you need to add the
  required configuration entry to your `:geolix` configuration:

      config :geolix,
        databases: [
          %{
            id: :my_csv_database,
            adapter: Geolix.Adapter.MaxMindCSV
          }
        ]
  """

  @behaviour Geolix.Adapter

  @impl Geolix.Adapter
  def lookup(_ip, _opts, _database), do: nil
end
