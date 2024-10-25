defmodule FirstMeet.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FirstMeetWeb.Telemetry,
      FirstMeet.Repo,
      {DNSCluster, query: Application.get_env(:first_meet, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: FirstMeet.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: FirstMeet.Finch},
      # Start a worker by calling: FirstMeet.Worker.start_link(arg)
      # {FirstMeet.Worker, arg},
      # Start to serve requests, typically the last entry
      FirstMeetWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FirstMeet.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FirstMeetWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
