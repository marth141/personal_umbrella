defmodule PersonalWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PersonalWeb.Telemetry,
      # Start the Endpoint (http/https)
      PersonalWeb.Endpoint
      # Start a worker by calling: PersonalWeb.Worker.start_link(arg)
      # {PersonalWeb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PersonalWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PersonalWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
