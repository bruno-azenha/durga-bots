defmodule Durga.Web.PageController do
  use Durga.Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
