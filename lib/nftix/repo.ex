defmodule Nftix.Repo do
  use Ecto.Repo,
    otp_app: :nftix,
    adapter: Ecto.Adapters.Postgres
end
