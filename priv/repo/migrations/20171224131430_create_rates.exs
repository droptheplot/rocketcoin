defmodule Rocketcoin.Repo.Migrations.CreateRates do
  use Ecto.Migration

  def change do
    create table(:rates, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :price, :integer, null: false
      add :currency_id, references(:currencies, on_delete: :delete_all, type: :binary_id), null: false

      timestamps()
    end

    create index(:rates, [:currency_id])
  end
end
