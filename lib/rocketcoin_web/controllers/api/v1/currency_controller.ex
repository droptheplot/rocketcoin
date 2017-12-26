defmodule RocketcoinWeb.Api.V1.CurrencyController do
  use RocketcoinWeb, :controller

  alias Rocketcoin.Market

  def calc(conn, %{"amount" => amount, "code" => code, "timestamp" => timestamp}) do
    {amount, _} = Integer.parse(amount)
    result = Market.calc(amount, code, timestamp)

    render conn, "calc.json", %{result: result}
  end

  def calc(conn, %{"amount" => amount, "code" => code}) do
    {amount, _} = Integer.parse(amount)
    result = Market.calc(amount, code, nil)

    render conn, "calc.json", %{result: result}
  end

  def calc(conn, _) do
    conn
    |> put_status(:unprocessable_entity)
    |> json(%{error: "Parameters `amount` and `code` are required."})
  end
end
