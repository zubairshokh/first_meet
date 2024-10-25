defmodule FirstMeet.Repo do
  use Ecto.Repo,
    otp_app: :first_meet,
    adapter: Ecto.Adapters.Postgres
end
