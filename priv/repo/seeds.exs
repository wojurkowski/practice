# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Practice.Repo.insert!(%Practice.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

1..1_000_000
|> Task.async_stream(fn _ ->
  Practice.Repo.insert!(%Practice.Models.User{})
end)
|> Stream.run()
