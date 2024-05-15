defmodule PracphoenixWeb.HelloController do
  use PracphoenixWeb, :controller

  def index(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :index)
  end

  def show(conn,%{"messenger" => messenger}) do
    render(conn,:show,messenger: messenger)
  end
end


# defmodule PracphoenixWeb.PageController do
#   use PracphoenixWeb, :controller

#   def home(conn, _params) do
#     # The home page is often custom made,
#     # so skip the default app layout.
#     render(conn, :home, layout: false)
#   end
# end
