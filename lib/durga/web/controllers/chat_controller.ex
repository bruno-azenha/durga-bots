defmodule Durga.Web.ChatController do
  use Durga.Web, :controller

  alias Durga.Bots

  def show(conn, %{"id" => id}) do
    bot = Bots.get_bot!(id)
    first_node = Bots.get_node!(bot.first_node_id)
    render(conn, "show.html", bot: bot, first_node: first_node)
  end
end
