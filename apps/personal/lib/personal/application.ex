defmodule Personal.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Personal.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Personal.PubSub}
      # Start a worker by calling: Personal.Worker.start_link(arg)
      # {Personal.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Personal.Supervisor)
  end
end
