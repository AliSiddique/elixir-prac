defmodule Pracphoenix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # PracphoenixWeb.Presence,
      # Start the Telemetry supervisor
      PracphoenixWeb.Telemetry,
      # Start the Ecto repository
      Pracphoenix.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Pracphoenix.PubSub},
      # Start Finch
      {Finch, name: Pracphoenix.Finch},
      # Start the Endpoint (http/https)
      PracphoenixWeb.Endpoint
      # Start a worker by calling: Pracphoenix.Worker.start_link(arg)
      # {Pracphoenix.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Pracphoenix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PracphoenixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
