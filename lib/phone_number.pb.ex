defmodule PhoneNumber.ParseRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          number_to_parse: String.t(),
          default_region: String.t()
        }
  defstruct [:number_to_parse, :default_region]

  field :number_to_parse, 1, type: :string
  field :default_region, 2, type: :string
end

defmodule PhoneNumber.PhoneNumberReply do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          country_code: integer,
          national_number: integer,
          extension: String.t(),
          italian_leading_zero: Google.Protobuf.BoolValue.t() | nil,
          number_of_leading_zeros: integer,
          raw_input: String.t(),
          country_code_source: String.t(),
          preferred_domestic_carrier_code: String.t()
        }
  defstruct [
    :country_code,
    :national_number,
    :extension,
    :italian_leading_zero,
    :number_of_leading_zeros,
    :raw_input,
    :country_code_source,
    :preferred_domestic_carrier_code
  ]

  field :country_code, 1, type: :int32
  field :national_number, 2, type: :int64
  field :extension, 3, type: :string
  field :italian_leading_zero, 4, type: Google.Protobuf.BoolValue
  field :number_of_leading_zeros, 5, type: :int32
  field :raw_input, 6, type: :string
  field :country_code_source, 7, type: :string
  field :preferred_domestic_carrier_code, 8, type: :string
end

defmodule PhoneNumber.PhoneNumber.Service do
  @moduledoc false
  use GRPC.Service, name: "phone_number.PhoneNumber"

  rpc :Parse, PhoneNumber.ParseRequest, PhoneNumber.PhoneNumberReply
  rpc :IsValidNumber, PhoneNumber.PhoneNumberReply, Google.Protobuf.BoolValue
  rpc :GetRegionCodeForNumber, PhoneNumber.PhoneNumberReply, Google.Protobuf.StringValue
end

defmodule PhoneNumber.PhoneNumber.Stub do
  @moduledoc false
  use GRPC.Stub, service: PhoneNumber.PhoneNumber.Service
end
