defmodule Durga.Web.ApiController do
  use Durga.Web, :controller

  alias Durga.Bots

  def get_node(conn, %{"id" => id}) do
      node = Bots.get_node!(id)
      conn
      |> put_layout(false)
      |> render(Durga.Web.ChatView, "_node_bubble.html", %{node: node})
  end

  def get_bot(conn, %{"id" => id}) do
    bot = Bots.get_bot!(id) |> IO.inspect()
    render conn, "get_bot.json", bot: bot
  end



end
