defmodule Lifeline.Repo do
  use Ecto.Repo,
    otp_app: :lifeline,
    adapter: Ecto.Adapters.MyXQL
end
