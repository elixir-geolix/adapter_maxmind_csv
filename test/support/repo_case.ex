# Copied from :phoenix
defmodule Geolix.Adapter.MaxMindCSV.RepoCase do
  @moduledoc false

  use ExUnit.CaseTemplate

  alias Ecto.Adapters.SQL.Sandbox
  alias Geolix.Adapter.MaxMindCSV.Repo

  using do
    quote do
      alias Geolix.Adapter.MaxMindCSV.Repo

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import Geolix.Adapter.MaxMindCSV.RepoCase
    end
  end

  setup tags do
    :ok = Sandbox.checkout(Repo)

    unless tags[:async] do
      Sandbox.mode(Repo, {:shared, self()})
    end

    :ok
  end

  @doc false
  def errors_on(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {message, opts} ->
      Regex.replace(~r"%{(\w+)}", message, fn _, key ->
        opts |> Keyword.get(String.to_existing_atom(key), key) |> to_string()
      end)
    end)
  end
end
