defmodule Rocketcoin.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: Rocketcoin.Repo

  alias Rocketcoin.Repo

  alias Rocketcoin.Market.Syncer
  alias Rocketcoin.Market.Currency
  alias Rocketcoin.Market.Rate

  def currency_factory do
    %Currency{
      name: sequence(:name, &"#{&1}coin"),
      code: sequence(:code, &"#{&1}C")
    }
  end
end
