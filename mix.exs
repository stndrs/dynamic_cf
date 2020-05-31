defmodule DynCloudflare.MixProject do
  use Mix.Project

  def project do
    [
      app: :dynamic_cf,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:castore, "~> 0.1.0"},
      {:mint, "~> 1.0"},
      {:mock, "~> 0.3.0", only: :test},
      {:bypass, "~> 1.0", only: :test}
    ]
  end
end
