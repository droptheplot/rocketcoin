defmodule Rocketcoin.MarketTest do
  use Rocketcoin.DataCase

  alias Rocketcoin.Market

  test "currencies_id_code_map/0 returns currencies map with code and id" do
    btc = insert(:currency)
    eth = insert(:currency)

    assert Market.currencies_id_code_map() == %{btc.code => btc.id, eth.code => eth.id}
  end
end
