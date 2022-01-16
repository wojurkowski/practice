defmodule Practice.Behaviours.DateTime do
  @moduledoc """
  Wrapper around DateTime so its possible to mock time in tests
  """
  @callback utc_now() :: DateTime.t()
end
