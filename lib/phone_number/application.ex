defmodule PhoneNumber.Application do
  use Application

  def start(_type, _args) do
    children = [
      {GRPC.Server.Supervisor, {PhoneNumber.Endpoint, 5001}}
    ]
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
