defmodule Geolix.Adapter.MaxMindCSV.IP do
  @moduledoc false

  use Bitwise, only_operators: true

  @doc """
  Converts an IP tuple to an integer for database lookups.
  """
  @spec to_integer(:inet.ip_address()) :: non_neg_integer
  def to_integer({a, b, c, d}) do
    (a <<< 24) + (b <<< 16) + (c <<< 8) + d
  end

  def to_integer({a, b, c, d, e, f, g, h}) do
    (a <<< 112) + (b <<< 96) + (c <<< 80) + (d <<< 64) + (e <<< 48) + (f <<< 32) + (g <<< 16) + h
  end
end
