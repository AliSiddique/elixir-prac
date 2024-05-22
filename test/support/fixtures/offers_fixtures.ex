defmodule Pracphoenix.OffersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Pracphoenix.Offers` context.
  """

  @doc """
  Generate a offer.
  """
  def offer_fixture(attrs \\ %{}) do
    {:ok, offer} =
      attrs
      |> Enum.into(%{
        course: "some course",
        uni: "some uni"
      })
      |> Pracphoenix.Offers.create_offer()

    offer
  end
end
