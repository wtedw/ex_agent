defmodule ExAgent.Application do
  use Application

  @impl true
  def start(_type, _args) do
    # Although we don't use the supervisor name below directly,
    # it can be useful when debugging or introspecting the system.

    children = [
      {DNSCluster, query: Application.get_env(:ex_agent, :dns_cluster_query) || :ignore},
      # {ExAgent.Supervisor, }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ExAgent.Supervisor]
    Supervisor.start_link(children, opts)

    # ExAgent.Supervisor.start_link(name: ExAgent.Supervisor)
  end

end
