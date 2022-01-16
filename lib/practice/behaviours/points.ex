defmodule Practice.Behaviours.Points do
  @callback update_random_points() :: {integer(), nil | [term()]}

  @callback get_users_by_points(integer()) :: [Ecto.Schema.t()]

  @callback max_number() :: integer()
end
