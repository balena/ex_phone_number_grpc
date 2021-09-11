defmodule PhoneNumber.Endpoint do
  use GRPC.Endpoint

  intercept GRPC.Logger.Server
  run PhoneNumber.Server
end
