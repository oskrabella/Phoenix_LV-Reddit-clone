defmodule RdditClone.Repo do
  use Ecto.Repo,
    otp_app: :rddit_clone,
    adapter: Ecto.Adapters.Postgres
end
