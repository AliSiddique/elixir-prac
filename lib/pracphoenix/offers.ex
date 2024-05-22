defmodule Pracphoenix.Offers do
  @moduledoc """
  The Offers context.
  """

  import Ecto.Query, warn: false
  alias Pracphoenix.Repo

  alias Pracphoenix.Offers.Offer
  alias Pracphoenix.PubSub

  def subscribe do
    Phoenix.PubSub.subscribe(Pracphoenix.PubSub, "offers")
  end

  def broadcast(message) do
    Phoenix.PubSub.broadcast(Pracphoenix.PubSub, "offers", message)
  end

  def search_offers(query) do
    list_offers()
    |> Enum.filter(&(&1.uni == query || &1.course == query))


  end
  @doc """
  Returns the list of offers.

  ## Examples

      iex> list_offers()
      [%Offer{}, ...]

  """
  def list_offers do
    Repo.all(Offer)
  end

  @doc """
  Gets a single offer.

  Raises `Ecto.NoResultsError` if the Offer does not exist.

  ## Examples

      iex> get_offer!(123)
      %Offer{}

      iex> get_offer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_offer!(id), do: Repo.get!(Offer, id)

  @doc """
  Creates a offer.

  ## Examples

      iex> create_offer(%{field: value})
      {:ok, %Offer{}}

      iex> create_offer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_offer(attrs \\ %{}) do
   {:ok,offer} =
    %Offer{}
    |> Offer.changeset(attrs)
    |> Repo.insert()

    broadcast({:new_offer, offer})
    {:ok, offer}
  end

  @doc """
  Updates a offer.

  ## Examples

      iex> update_offer(offer, %{field: new_value})
      {:ok, %Offer{}}

      iex> update_offer(offer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_offer(%Offer{} = offer, attrs) do
    offer
    |> Offer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a offer.

  ## Examples

      iex> delete_offer(offer)
      {:ok, %Offer{}}

      iex> delete_offer(offer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_offer(%Offer{} = offer) do
    Repo.delete(offer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking offer changes.

  ## Examples

      iex> change_offer(offer)
      %Ecto.Changeset{data: %Offer{}}

  """
  def change_offer(%Offer{} = offer, attrs \\ %{}) do
    Offer.changeset(offer, attrs)
  end


end
