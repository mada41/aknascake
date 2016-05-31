defmodule Aknascake.PageController do
  use Aknascake.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
