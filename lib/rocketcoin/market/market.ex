defmodule Rocketcoin.Market do
  import Ecto.Query, warn: false
  alias Rocketcoin.Repo

  alias Rocketcoin.Market.Currency
  alias Rocketcoin.Market.Rate

  def create_currency(attrs \\ %{}) do
    %Currency{}
    |> Currency.changeset(attrs)
    |> Repo.insert()
  end

  def create_rates(rates \\ []) do
    Repo.insert_all(Rate, rates)
  end

  def currencies_id_code_map() do
    from(c in Currency, select: {c.code, c.id})
    |> Repo.all()
    |> Map.new(fn(x) -> x end)
  end
end
