defmodule Rocketcoin.Market.Currency do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rocketcoin.Market.Currency

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "currencies" do
    field :code, :string
    field :name, :string

    timestamps()
  end

  def changeset(%Currency{} = currency, attrs) do
    currency
    |> cast(attrs, [:name, :code])
    |> validate_required([:name, :code])
    |> unique_constraint(:code_uniqueness, name: :currencies_code_uniqueness_index)
  end
end
