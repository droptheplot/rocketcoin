defmodule Rocketcoin.SyncerTest do
  use Rocketcoin.DataCase

  alias Rocketcoin.Repo

  alias Rocketcoin.Market.Syncer
  alias Rocketcoin.Market.Rate

  test "call/0 fetches prices and creates rates" do
    btc = insert(:currency, %{code: "BTC"})
    eth = insert(:currency, %{code: "ETH"})

    Syncer.call()

    synced_rates = Repo.all(from(r in Rate, select: {r.currency_id, r.price}))
    assert synced_rates == [{btc.id, 1_000_000}, {eth.id, 100_000}]
  end
end
