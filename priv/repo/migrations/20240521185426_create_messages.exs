defmodule Pracphoenix.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :email, :string
      add :message, :string

      timestamps()
    end
  end
end
