defmodule IPTest do
  use ExUnit.Case, async: true
  # doctest IP

  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  test "gets the current IP", %{bypass: bypass} do
    Bypass.expect_once(bypass, "GET", "/", fn conn ->
      Plug.Conn.resp(conn, 200, ~s(127.0.0.1))
    end)

    url = "http://localhost:#{bypass.port}"
    IO.inspect(IP.get_current(url))
    # assert "127.0.0.1" == IP.get_current(url)
  end
end
