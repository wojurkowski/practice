defmodule Practice.Models.User do
  @moduledoc """
  User model
  """

  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :points]}

  schema "users" do
    field :points, :integer

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:points])
  end
end
