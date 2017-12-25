defmodule Rocketcoin.Source do
  # Should return map like %{"BTC" => 1350836} where value is a price in cents.
  @callback fetch(list(String.t), String.t) :: any
end
