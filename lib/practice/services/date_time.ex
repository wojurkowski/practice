defmodule Practice.Services.DateTime do
  @moduledoc """
  Time and date operations and formatting
  """

  alias Practice.Behaviours.DateTime, as: DateTimeBehaviour

  @behaviour DateTimeBehaviour

  @impl DateTimeBehaviour
  def utc_now() do
    DateTime.utc_now()
  end

  def format(nil), do: nil
  def format(timestamp), do: Calendar.strftime(timestamp, "%Y-%m-%d %H:%M:%S")
end
