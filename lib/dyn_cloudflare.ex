defmodule DynCloudflare do
  @moduledoc """
  Documentation for DynCloudflare.
  """

  @doc """
  Update IP address

  ## Examples

      iex> DynCloudflare.run()
      :ok

  """
  def run do
    IP.get_current
  end
end
