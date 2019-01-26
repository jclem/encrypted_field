defmodule EncryptedField.MixProject do
  use Mix.Project

  @version "1.0.0"
  @github_url "https://github.com/jclem/encrypted_field"

  def project do
    [
      app: :encrypted_field,
      description: "An Ecto field that is encrypted in the database",
      version: @version,
      package: package(),
      name: "EncryptedField",
      homepage_url: @github_url,
      source_url: @github_url,
      docs: docs(),
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      name: :encrypted_field,
      licenses: ["MIT"],
      maintainers: ["Jonathan Clem <jonathan@jclem.net>"],
      links: %{"GitHub" => @github_url}
    ]
  end

  defp docs do
    [extras: ~w(README.md LICENSE.md), main: "readme", source_ref: "v#{@version}"]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto, "~> 3.0"},
      {:dialyxir, "1.0.0-rc.4", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.19.3"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
