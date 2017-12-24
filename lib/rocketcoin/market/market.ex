defmodule Rocketcoin.Market do
  import Ecto.Query, warn: false
  alias Rocketcoin.Repo

  alias Rocketcoin.Market.Currency

  def create_currency(attrs \\ %{}) do
    %Currency{}
    |> Currency.changeset(attrs)
    |> Repo.insert()
  end
end
