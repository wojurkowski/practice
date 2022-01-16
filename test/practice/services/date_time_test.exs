defmodule Practice.Services.DateTimeTest do
  use ExUnit.Case, async: true

  alias Practice.Services.DateTime, as: DateTimeService

  describe "format/1" do
    test "do nothing for nil" do
      assert DateTimeService.format(nil) == nil
    end

    test "formats timestamp to Y-m-d H:M:S" do
      assert DateTimeService.format(~U[2022-01-16 12:00:00.000000Z]) == "2022-01-16 12:00:00"
    end
  end
end
