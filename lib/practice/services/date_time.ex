defmodule Practice.Services.DateTime do
  alias Practice.Behaviours.DateTime, as: DateTimeBehaviour

  @behaviour DateTimeBehaviour

  @impl DateTimeBehaviour
  def utc_now() do
    DateTime.utc_now()
  end
end
