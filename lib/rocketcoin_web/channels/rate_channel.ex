defmodule RocketcoinWeb.RateChannel do
  use Phoenix.Channel

  def join("rates", _message, socket) do
    {:ok, socket}
  end
end
