defmodule Practice.PointsWorker do
  @moduledoc """
  Module that runs every minute when application is started. Every time it runs:
  - it picks up a new max_number from range 0 to 100
  - it calls a service to update every user points in the database to random number

  in the state it keeps track of current max_number and the last genserver query timestamp
  """
  use GenServer

  def date_time_service() do
    Application.get_env(:practice, Practice.Services)[:date_time_service]
  end

  def points_service() do
    Application.get_env(:practice, Practice.Services)[:points_service]
  end

  def randomize() do
    GenServer.call(__MODULE__, :randomize)
  end

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  def init(state) do
    schedule_points_random_update()
    {:ok, state}
  end

  def handle_call(:randomize, _from, state) do
    reply = %{
      users: points_service().get_users_by_points(state.max_number),
      timestamp: state.timestamp
    }

    {:reply, reply, %{state | timestamp: date_time_service().utc_now()}}
  end

  def handle_info(:randomize, state) do
    max_number = points_service().max_number()
    points_service().update_random_points()
    schedule_points_random_update()
    {:noreply, %{state | max_number: max_number}}
  end

  defp schedule_points_random_update do
    Process.send_after(self(), :randomize, 60_000)
  end
end
