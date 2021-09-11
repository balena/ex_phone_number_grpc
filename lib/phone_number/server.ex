defmodule PhoneNumber.Server do
  use GRPC.Server, service: PhoneNumber.PhoneNumber.Service

  def parse(request, _stream) do
    {:ok, phone_number} = ExPhoneNumber.parse(request.number_to_parse, request.default_region)

    phone_number
    |> Map.to_list()
    |> PhoneNumber.PhoneNumberReply.new()
  end

  def is_valid_number(request, _stream) do
    value = ExPhoneNumber.is_valid_number?(to_model(request))

    Google.Protobuf.BoolValue.new(%{value: value})
  end

  def get_region_code_for_number(request, _stream) do
    value = ExPhoneNumber.Metadata.get_region_code_for_number(to_model(request))

    Google.Protobuf.StringValue.new(%{value: value})
  end

  defp to_model(request) do
    %ExPhoneNumber.Model.PhoneNumber{
      country_code: request.country_code,
      national_number: request.national_number,
      extension: request.extension,
      italian_leading_zero: request.italian_leading_zero,
      number_of_leading_zeros: request.number_of_leading_zeros,
      raw_input: request.raw_input,
      country_code_source: request.country_code_source,
      preferred_domestic_carrier_code: request.preferred_domestic_carrier_code
    }
  end
end
