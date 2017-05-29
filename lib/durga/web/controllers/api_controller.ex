defmodule Durga.Web.ApiController do
  use Durga.Web, :controller

  alias Durga.Bots

  def get_node(conn, %{"id" => id}) do
      node = Bots.get_node!(id)
      conn
      |> put_layout(false)
      |> render(Durga.Web.ChatView, "_node_bubble.html", %{node: node})
  end

end
