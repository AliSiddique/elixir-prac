defmodule Pracphoenix.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :email, :string
    field :message, :string

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:id, :message])
    |> validate_required([:id, :message])
  end
end
