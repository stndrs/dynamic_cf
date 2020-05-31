defmodule IP do
  def get_current(url) do
    {:ok, conn} = Mint.HTTP.connect(:http, url, 80)
    {:ok, conn, _request_ref} = Mint.HTTP.request(conn, "GET", "/", [], "")
    receive do
      message ->
        case Mint.HTTP.stream(conn, message) do
          {:ok, _conn, responses} ->
            handle_responses(responses) |> clean_ip
        end
    end
  end

  defp handle_responses([head | tail]) do
    case head do
      {:data, _request_ref, data} ->
        data
      _ ->
        handle_responses(tail)
    end
  end

  defp clean_ip(ip) do
    String.replace(ip, "\n", "")
  end
end
