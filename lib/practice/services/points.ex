defmodule Practice.Services.Points do
  @doc """
  Module to interact with user points
  """

  import Ecto.Query
  alias Practice.Models.User
  alias Practice.Repo
  alias Practice.Behaviours.Points, as: PointsBehaviour

  @behaviour PointsBehaviour

  @impl PointsBehaviour
  def update_random_points() do
    update(User, set: [points: fragment("floor(random()*100)")])
    |> Repo.update_all([])
  end

  @impl PointsBehaviour
  def get_users_by_points(points) do
    from(u in User)
    |> where([user], user.points > ^points)
    |> limit(2)
    |> Repo.all()
  end

  @impl PointsBehaviour
  def max_number() do
    Enum.random(0..100)
  end
end
