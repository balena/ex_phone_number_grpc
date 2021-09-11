defmodule PhoneNumber do
  def connect() do
    GRPC.Stub.connect("localhost:5001")
  end

  def parse(channel, number_to_parse, default_region) do
    request =
      PhoneNumber.ParseRequest.new(
        number_to_parse: number_to_parse,
        default_region: default_region
      )

    PhoneNumber.PhoneNumber.Stub.parse(channel, request)
  end

  def is_valid_number(channel, reply) do
    channel
    |> PhoneNumber.PhoneNumber.Stub.is_valid_number(reply)
  end

  def get_region_code_for_number(channel, reply) do
    channel
    |> PhoneNumber.PhoneNumber.Stub.get_region_code_for_number(reply)
  end
end
