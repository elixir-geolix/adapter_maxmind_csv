defmodule Geolix.Adapter.MaxMindCSV.IPTest do
  use ExUnit.Case, async: true

  alias Geolix.Adapter.MaxMindCSV.IP

  test "ipv4 to integer" do
    {:ok, ip} = :inet.parse_address('8.8.8.8')

    assert 134_744_072 == IP.to_integer(ip)
  end

  test "ipv6 to integer" do
    {:ok, ip} = :inet.parse_address('2001:4860:4860::8888')

    assert 42_541_956_123_769_884_636_017_138_956_568_135_816 == IP.to_integer(ip)
  end
end
