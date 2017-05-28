defmodule Durga.Web.ChatController do
  use Durga.Web, :controller

  alias Durga.Bots

  def show(conn, %{"id" => id}) do
    bot = Bots.get_bot!(id)
    render(conn, "show.html", bot: bot)
  end
end
