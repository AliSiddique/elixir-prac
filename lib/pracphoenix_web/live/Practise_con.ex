defmodule PracphoenixWeb.PractiseCon do

  use PracphoenixWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-sm">
     <h1 class="text-center">live</h1>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket, temporary_assigns: []}
  end
end
