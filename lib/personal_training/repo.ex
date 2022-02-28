defmodule PersonalTraining.Repo do
  use Ecto.Repo,
    otp_app: :personal_training,
    adapter: Ecto.Adapters.Postgres
end
