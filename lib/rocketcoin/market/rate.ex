defmodule Rocketcoin.Market.Rate do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false

  alias Rocketcoin.Market.Rate
  alias Rocketcoin.Market.Currency

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "rates" do
    field :price, :integer
    belongs_to :currency, Currency

    timestamps()
  end

  def changeset(%Rate{} = rate, attrs) do
    rate
    |> cast(attrs, [:price])
    |> validate_required([:price])
  end

  def actual(query, code) do
    from q in query,
      join: c in Currency, where: c.id == q.currency_id, where: c.code == ^code,
      order_by: [desc: q.inserted_at],
      limit: 1
  end

  def actual(query) do
    from q in query,
      join: c in Currency, where: c.id == q.currency_id,
      order_by: [desc: q.inserted_at],
      distinct: c.code,
      preload: :currency
  end

  def after_timestamp(query, nil), do: query
  def after_timestamp(query, timestamp) do
    from q in query,
      where: q.inserted_at < ^timestamp
  end
end
