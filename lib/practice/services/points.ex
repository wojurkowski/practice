defmodule Practice.Services.Points do
  @doc """
  Module to interact with user points
  """

  import Ecto.Query
  alias Practice.Models.User
  alias Practice.Repo

  def update_random_points() do
    update(User, set: [points: fragment("floor(random()*100)")])
    |> Repo.update_all([])
  end

  def get_users_by_points(points) do
    from(u in User)
    |> where([user], user.points > ^points)
    |> limit(2)
    |> Repo.all()
  end

  def max_number() do
    Enum.random(1..100)
  end
end
