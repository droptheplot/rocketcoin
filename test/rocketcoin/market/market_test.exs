defmodule Rocketcoin.MarketTest do
  use Rocketcoin.DataCase

  alias Rocketcoin.Market

  test "currencies_id_code_map/0 returns currencies map with code and id" do
    btc = insert(:currency)
    eth = insert(:currency)

    assert Market.currencies_id_code_map() == %{btc.code => btc.id, eth.code => eth.id}
  end

  test "get_actual_rate/2 returns rate for currency after given timestamp" do
    btc = insert(:currency)
    eth = insert(:currency)

    btc_first_rate = insert(:rate, currency: btc, inserted_at: ~N[2000-01-01 00:00:10])
    btc_last_rate = insert(:rate, currency: btc, inserted_at: ~N[2000-01-01 00:00:20])

    assert Market.get_actual_rate(btc.code, nil).id == btc_last_rate.id
    assert Market.get_actual_rate(btc.code, ~N[2000-01-01 00:00:25]).id == btc_last_rate.id
    assert Market.get_actual_rate(btc.code, ~N[2000-01-01 00:00:15]).id == btc_first_rate.id
  end
end
