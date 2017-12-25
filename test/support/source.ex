defmodule Rocketcoin.Test.Source do
  @moduledoc """
  Use to mock any implementation of `Rocketcoin.Source`
  """

  @behaviour Rocketcoin.Source

  def fetch(_, _) do
    %{"BTC" => 1_000_000, "ETH" => 100_000}
  end
end
