defmodule LifelineWeb.PageController do
  use LifelineWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
