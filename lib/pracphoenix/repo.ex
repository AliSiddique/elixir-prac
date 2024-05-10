defmodule Pracphoenix.Repo do
  use Ecto.Repo,
    otp_app: :pracphoenix,
    adapter: Ecto.Adapters.SQLite3
end
