defmodule ShuttleApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :shuttle_api,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ShuttleApi.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:ash, "~> 2.9.5"},
      {:ash_json_api, "~> 0.31.1"},
      {:plug_cowboy, "~> 2.0"},
      {:bandit, "~> 0.6"},
      {:ash_postgres, "~> 1.3.6"}
    ]
  end
end
