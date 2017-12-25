defmodule Rocketcoin.Market.Syncer do
  alias Rocketcoin.Market
  alias Rocketcoin.Market.Currency
  alias Rocketcoin.Market.Rate

  @syncer_source Application.get_env(:rocketcoin, :syncer_source)
  @currency_code Application.get_env(:rocketcoin, :currency_code)

  def call() do
    currencies = Market.currencies_id_code_map
    current_datetime = Ecto.DateTime.utc()

    Map.keys(currencies)
    |> @syncer_source.fetch(@currency_code)
    |> Enum.map(fn({k, v}) ->
      [
        currency_id: currencies[k],
        price: v,
        inserted_at: current_datetime,
        updated_at: current_datetime
      ]
    end)
    |> Market.create_rates
  end
end
