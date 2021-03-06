defmodule RocketcoinWeb.Broadcaster do
  alias RocketcoinWeb.Endpoint

  alias Rocketcoin.Market

  def call(timestamp \\ nil) do
    rates = Market.get_actual_rates(timestamp)
    |> Enum.map(&to_json/1)

    Endpoint.broadcast("rates", "new_rate", %{rates: rates})
  end

  defp to_json(rate) do
    %{
      name: rate.currency.name,
      code: rate.currency.code,
      price: rate.price
    }
  end
end

