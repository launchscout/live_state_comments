defmodule LiveStateComments.Repo do
  use Ecto.Repo,
    otp_app: :live_state_comments,
    adapter: Ecto.Adapters.Postgres
end
