# ExPhoneNumbers via gRPC

This is a simple PoC showing how to perform gRPC calls to `ex_phone_numbers`.

The idea is to isolate the `ex_phone_numbers` in another application so we can hot upgrade it using Distillery, exempting to redeploy applications that use `libphonenumber` when they need to simply update the XML definitions.

In order to run do:

```
iex -S mix
```

then:

```elixir
{:ok, channel} = PhoneNumber.connect()
{:ok, reply} = channel |> PhoneNumber.parse("+5548999999999")
{:ok, %{value: region_code}} = channel |> PhoneNumber.get_region_code_for_number(reply)
```

