defmodule FbManager.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    # List all child processes to be supervised
    children = [
      worker(FbManager.FFServer, []) #[[name: FFNerd]])
      # Starts a worker by calling: FbManager.Worker.start_link(arg)
      # {FbManager.Worker, arg},
      
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FbManager.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
