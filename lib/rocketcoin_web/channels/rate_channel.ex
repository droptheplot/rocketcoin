defmodule RocketcoinWeb.RateChannel do
  use Phoenix.Channel

  alias RocketcoinWeb.Broadcaster

  def join("rates", _message, socket) do
    {:ok, socket}
  end

  def handle_in("refresh", %{"timestamp" => timestamp}, socket) do
    Broadcaster.call(timestamp)

    {:noreply, socket}
  end
end
