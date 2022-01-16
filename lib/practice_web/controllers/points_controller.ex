defmodule PracticeWeb.PointsController do
  use PracticeWeb, :controller

  alias Practice.PointsWorker

  def index(conn, _params) do
    response = PointsWorker.randomize()

    json(conn, response)
  end
end
