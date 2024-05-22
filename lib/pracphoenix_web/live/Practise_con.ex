defmodule PracphoenixWeb.PractiseCon do

  use PracphoenixWeb, :live_view

  def render(assigns) do
    ~H"""
    <.link href={~p"/auth/google"}>
      <.button>Login with Google</.button>
    </.link>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket, temporary_assigns: []}
  end
end
