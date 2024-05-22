defmodule Pracphoenix.Offers.Offer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "offers" do
    field :uni, :string
    field :course, :string

    timestamps()
  end

  @doc false
  def changeset(offer, attrs) do
    offer
    |> cast(attrs, [:uni, :course])
    |> validate_required([:uni, :course])
    |> validate_length(:uni, min: 3, max: 40)
  end
end
