defmodule Rocketcoin.Market.Worker do
  use GenServer

  alias Rocketcoin.Market
  alias Rocketcoin.Market.Syncer
  alias RocketcoinWeb.Broadcaster

  def start_link do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    schedule_sync()
    {:ok, state}
  end

  def handle_info(:sync, state) do
    Syncer.call()
    Broadcaster.call()

    schedule_sync()
    {:noreply, state}
  end

  defp schedule_sync() do
    Process.send_after(self(), :sync, 1000 * 60)
  end
end
