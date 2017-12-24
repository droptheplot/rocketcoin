defmodule RocketcoinWeb.PageController do
  use RocketcoinWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
