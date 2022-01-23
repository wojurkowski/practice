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
|> Enum.chunk_every(10000)
|> Task.async_stream(fn chunk ->
  timestamp = NaiveDateTime.local_now()

  users =
    chunk
    |> Enum.map(fn _user -> %{inserted_at: timestamp, updated_at: timestamp} end)

  Practice.Repo.insert_all(Practice.Models.User, users)
end)
|> Stream.run()
