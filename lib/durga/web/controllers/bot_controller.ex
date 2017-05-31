defmodule Durga.Web.BotController do
  use Durga.Web, :controller

  alias Durga.Bots

  def index(conn, _params) do
    bots = Bots.list_bots()
    render(conn, "index.html", bots: bots)
  end

  def new(conn, _params) do
    changeset = Bots.change_bot(%Durga.Bots.Bot{})
    nodes = Bots.list_nodes();
    render(conn, "new.html", changeset: changeset, nodes: nodes)
  end

  def create(conn, %{"bot" => bot_params}) do
    case Bots.create_bot(bot_params) do
      {:ok, bot} ->
        conn
        |> put_flash(:info, "Bot created successfully.")
        |> redirect(to: bot_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    bot = Bots.get_bot!(id)
    render(conn, "show.html", bot: bot)
  end

  def delete(conn, %{"id" => id}) do
    bot = Bots.get_bot!(id)
    {:ok, _bot} = Bots.delete_bot(bot)

    conn
    |> put_flash(:info, "Bot deleted successfully.")
    |> redirect(to: bot_path(conn, :index))
  end
end
