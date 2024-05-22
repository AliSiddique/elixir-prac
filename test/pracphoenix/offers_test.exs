defmodule Pracphoenix.OffersTest do
  use Pracphoenix.DataCase

  alias Pracphoenix.Offers

  describe "offers" do
    alias Pracphoenix.Offers.Offer

    import Pracphoenix.OffersFixtures

    @invalid_attrs %{uni: nil, course: nil}

    test "list_offers/0 returns all offers" do
      offer = offer_fixture()
      assert Offers.list_offers() == [offer]
    end

    test "get_offer!/1 returns the offer with given id" do
      offer = offer_fixture()
      assert Offers.get_offer!(offer.id) == offer
    end

    test "create_offer/1 with valid data creates a offer" do
      valid_attrs = %{uni: "some uni", course: "some course"}

      assert {:ok, %Offer{} = offer} = Offers.create_offer(valid_attrs)
      assert offer.uni == "some uni"
      assert offer.course == "some course"
    end

    test "create_offer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Offers.create_offer(@invalid_attrs)
    end

    test "update_offer/2 with valid data updates the offer" do
      offer = offer_fixture()
      update_attrs = %{uni: "some updated uni", course: "some updated course"}

      assert {:ok, %Offer{} = offer} = Offers.update_offer(offer, update_attrs)
      assert offer.uni == "some updated uni"
      assert offer.course == "some updated course"
    end

    test "update_offer/2 with invalid data returns error changeset" do
      offer = offer_fixture()
      assert {:error, %Ecto.Changeset{}} = Offers.update_offer(offer, @invalid_attrs)
      assert offer == Offers.get_offer!(offer.id)
    end

    test "delete_offer/1 deletes the offer" do
      offer = offer_fixture()
      assert {:ok, %Offer{}} = Offers.delete_offer(offer)
      assert_raise Ecto.NoResultsError, fn -> Offers.get_offer!(offer.id) end
    end

    test "change_offer/1 returns a offer changeset" do
      offer = offer_fixture()
      assert %Ecto.Changeset{} = Offers.change_offer(offer)
    end
  end
end
