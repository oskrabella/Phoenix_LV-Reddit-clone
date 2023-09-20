defmodule RdditClone.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      RdditCloneWeb.Telemetry,
      # Start the Ecto repository
      RdditClone.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: RdditClone.PubSub},
      # Start Finch
      {Finch, name: RdditClone.Finch},
      # Start the Endpoint (http/https)
      RdditCloneWeb.Endpoint
      # Start a worker by calling: RdditClone.Worker.start_link(arg)
      # {RdditClone.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RdditClone.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RdditCloneWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
