defmodule ProtobufUnittest.TestNumbers.MyType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :OK | :WARNING | :ERROR

  field :OK, 0
  field :WARNING, 1
  field :ERROR, 2
end

defmodule ProtobufUnittest.TestFlagsAndStrings.RepeatedGroup do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          f: String.t()
        }
  defstruct [:f]

  field :f, 3, required: true, type: :string
end

defmodule ProtobufUnittest.TestFlagsAndStrings do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          A: integer,
          repeatedgroup: [any]
        }
  defstruct [:A, :repeatedgroup]

  field :A, 1, required: true, type: :int32
  field :repeatedgroup, 2, repeated: true, type: :group
end

defmodule ProtobufUnittest.TestBase64ByteArrays do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          a: binary
        }
  defstruct [:a]

  field :a, 1, required: true, type: :bytes
end

defmodule ProtobufUnittest.TestJavaScriptJSON do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          a: integer,
          final: float | :infinity | :negative_infinity | :nan,
          in: String.t(),
          Var: String.t()
        }
  defstruct [:a, :final, :in, :Var]

  field :a, 1, optional: true, type: :int32
  field :final, 2, optional: true, type: :float
  field :in, 3, optional: true, type: :string
  field :Var, 4, optional: true, type: :string
end

defmodule ProtobufUnittest.TestJavaScriptOrderJSON1 do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          d: integer,
          c: integer,
          x: boolean,
          b: integer,
          a: integer
        }
  defstruct [:d, :c, :x, :b, :a]

  field :d, 1, optional: true, type: :int32
  field :c, 2, optional: true, type: :int32
  field :x, 3, optional: true, type: :bool
  field :b, 4, optional: true, type: :int32
  field :a, 5, optional: true, type: :int32
end

defmodule ProtobufUnittest.TestJavaScriptOrderJSON2 do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          d: integer,
          c: integer,
          x: boolean,
          b: integer,
          a: integer,
          z: [ProtobufUnittest.TestJavaScriptOrderJSON1.t()]
        }
  defstruct [:d, :c, :x, :b, :a, :z]

  field :d, 1, optional: true, type: :int32
  field :c, 2, optional: true, type: :int32
  field :x, 3, optional: true, type: :bool
  field :b, 4, optional: true, type: :int32
  field :a, 5, optional: true, type: :int32
  field :z, 6, repeated: true, type: ProtobufUnittest.TestJavaScriptOrderJSON1
end

defmodule ProtobufUnittest.TestLargeInt do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          a: integer,
          b: non_neg_integer
        }
  defstruct [:a, :b]

  field :a, 1, required: true, type: :int64
  field :b, 2, required: true, type: :uint64
end

defmodule ProtobufUnittest.TestNumbers do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          a: ProtobufUnittest.TestNumbers.MyType.t(),
          b: integer,
          c: float | :infinity | :negative_infinity | :nan,
          d: boolean,
          e: float | :infinity | :negative_infinity | :nan,
          f: non_neg_integer
        }
  defstruct [:a, :b, :c, :d, :e, :f]

  field :a, 1, optional: true, type: ProtobufUnittest.TestNumbers.MyType, enum: true
  field :b, 2, optional: true, type: :int32
  field :c, 3, optional: true, type: :float
  field :d, 4, optional: true, type: :bool
  field :e, 5, optional: true, type: :double
  field :f, 6, optional: true, type: :uint32
end

defmodule ProtobufUnittest.TestCamelCase do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          normal_field: String.t(),
          CAPITAL_FIELD: integer,
          CamelCaseField: integer
        }
  defstruct [:normal_field, :CAPITAL_FIELD, :CamelCaseField]

  field :normal_field, 1, optional: true, type: :string
  field :CAPITAL_FIELD, 2, optional: true, type: :int32
  field :CamelCaseField, 3, optional: true, type: :int32
end

defmodule ProtobufUnittest.TestBoolMap.BoolMapEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: boolean,
          value: integer
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :bool
  field :value, 2, optional: true, type: :int32
end

defmodule ProtobufUnittest.TestBoolMap do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          bool_map: %{boolean => integer}
        }
  defstruct [:bool_map]

  field :bool_map, 1, repeated: true, type: ProtobufUnittest.TestBoolMap.BoolMapEntry, map: true
end

defmodule ProtobufUnittest.TestRecursion do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          value: integer,
          child: ProtobufUnittest.TestRecursion.t() | nil
        }
  defstruct [:value, :child]

  field :value, 1, optional: true, type: :int32
  field :child, 2, optional: true, type: ProtobufUnittest.TestRecursion
end

defmodule ProtobufUnittest.TestStringMap.StringMapEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: :string
end

defmodule ProtobufUnittest.TestStringMap do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          string_map: %{String.t() => String.t()}
        }
  defstruct [:string_map]

  field :string_map, 1,
    repeated: true,
    type: ProtobufUnittest.TestStringMap.StringMapEntry,
    map: true
end

defmodule ProtobufUnittest.TestStringSerializer.StringMapEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: :string
end

defmodule ProtobufUnittest.TestStringSerializer do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          scalar_string: String.t(),
          repeated_string: [String.t()],
          string_map: %{String.t() => String.t()}
        }
  defstruct [:scalar_string, :repeated_string, :string_map]

  field :scalar_string, 1, optional: true, type: :string
  field :repeated_string, 2, repeated: true, type: :string

  field :string_map, 3,
    repeated: true,
    type: ProtobufUnittest.TestStringSerializer.StringMapEntry,
    map: true
end

defmodule ProtobufUnittest.TestMessageWithExtension do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule ProtobufUnittest.TestExtension do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          value: String.t()
        }
  defstruct [:value]

  field :value, 1, optional: true, type: :string
end
