defmodule PracticeWeb.PointsController do
  use PracticeWeb, :controller

  alias Practice.PointsWorker
  alias Practice.Services.DateTime

  def index(conn, _params) do
    response = PointsWorker.randomize()

    response = %{response | timestamp: DateTime.format(response.timestamp)}

    json(conn, response)
  end
end
