defmodule Practice.PointsWorkerTest do
  use ExUnit.Case, async: true

  import Mox

  alias Practice.PointsWorker
  alias Practice.Services.PointsMock
  alias Practice.Services.DateTimeMock

  @initial_state %{max_number: 0, timestamp: nil}

  describe "points worker" do
    test "handle_info :randomize sets max_number in state" do
       expect(PointsMock, :max_number, fn -> 10 end)
       expect(PointsMock, :update_random_points, fn -> nil end)
       {:noreply, state} = PointsWorker.handle_info(:randomize, @initial_state)

       assert %{max_number: 10, timestamp: nil} = state
    end

    test "handle_call :randomize returns last genserver query time" do
      first_call_timestamp = ~U[2022-01-15 12:00:00.000000Z]
      expect(PointsMock, :get_users_by_points, fn 0 -> [] end)
      expect(DateTimeMock, :utc_now, fn -> first_call_timestamp end)

      {:reply, reply, state} =
        PointsWorker.handle_call(:randomize, self(), @initial_state)

      assert reply.timestamp == nil

      second_call_timestamp = ~U[2022-01-15 12:30:00.000000Z]
      expect(PointsMock, :get_users_by_points, fn 0 -> [] end)
      expect(DateTimeMock, :utc_now, fn -> second_call_timestamp end)

      {:reply, reply, _state} =
        PointsWorker.handle_call(:randomize, self(), state)

      assert reply.timestamp == first_call_timestamp
    end
  end
end
