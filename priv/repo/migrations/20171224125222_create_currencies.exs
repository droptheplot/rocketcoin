defmodule Rocketcoin.Repo.Migrations.CreateCurrencies do
  use Ecto.Migration

  def change do
    create table(:currencies, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :code, :string, null: false

      timestamps()
    end

    create unique_index(:currencies, :code, name: :currencies_code_uniqueness_index)
  end
end
