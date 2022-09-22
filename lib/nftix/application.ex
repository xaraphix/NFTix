defmodule Nftix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      NftixWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Nftix.PubSub},
      # Start the Endpoint (http/https)
      NftixWeb.Endpoint
      # Start a worker by calling: Nftix.Worker.start_link(arg)
      # {Nftix.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Nftix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(newww, _new, removed) do
    NftixWeb.Endpoint.config_change(newww, removed)
    :ok
  end
end