defmodule Practice.Services.PointsTest do
  use Practice.DataCase

  alias Practice.Repo
  alias Practice.Services.Points
  alias Practice.Models.User

  describe "get_users_by_points/1" do
    test "returns two users with greater than given points" do
      user_fixture([10, 20, 30, 40, 50])
      users = Points.get_users_by_points(30)

      assert Enum.count(users) == 2

      [first_user | [second_user | []]] = users

      assert first_user.points == 40
      assert second_user.points == 50
    end

    test "returns empty list if there are no users with more than given points" do
      user_fixture([10, 20, 30, 40, 50])

      assert Points.get_users_by_points(60) == []
    end
  end

  test "update_random_points should update every user points within 1..100 range" do
    user_fixture([-1, -2, -3])

    Points.update_random_points()

    User
    |> Repo.all()
    |> Enum.map(fn user ->
      assert user.points in 1..100
    end)
  end

  defp user_fixture(points) do
    points
     |> Enum.each(fn points_value ->
      Repo.insert!(%User{points: points_value})
    end)
  end
end
