defmodule Rocketcoin.Market.Rate do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rocketcoin.Market.Rate

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "rates" do
    field :price, :integer
    field :currency_id, :binary_id

    timestamps()
  end

  def changeset(%Rate{} = rate, attrs) do
    rate
    |> cast(attrs, [:price])
    |> validate_required([:price])
  end
end
