defmodule ExPhoneNumbersRemote.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_phone_numbers_grpc,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {PhoneNumber.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:grpc, github: "elixir-grpc/grpc"},
      {:cowlib, "~> 2.11", override: true},
      {:ex_phone_number, "~> 0.2.1"}
    ]
  end
end
