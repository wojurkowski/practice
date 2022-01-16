Mox.defmock(Practice.Services.PointsMock, for: Practice.Behaviours.Points)

Mox.defmock(Practice.Services.DateTimeMock, for: Practice.Behaviours.DateTime)

Application.put_env(:practice, Practice.Services,
  date_time_service: Practice.Services.DateTimeMock,
  points_service: Practice.Services.PointsMock
)

ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Practice.Repo, :manual)
