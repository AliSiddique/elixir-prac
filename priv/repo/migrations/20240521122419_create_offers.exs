defmodule Pracphoenix.Repo.Migrations.CreateOffers do
  use Ecto.Migration

  def change do
    create table(:offers) do
      add :uni, :string
      add :course, :string

      timestamps()
    end
  end
end
