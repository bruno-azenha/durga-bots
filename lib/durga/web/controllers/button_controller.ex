defmodule Durga.Web.ButtonController do
  use Durga.Web, :controller

  alias Durga.Bots
  
  def new(conn, %{"node_id" => node_id} = params) do
    changeset = Bots.change_button(%Durga.Bots.Button{})
    node = Bots.get_node!(node_id)
    bot = Bots.get_bot!(node.bot_id);
    render(conn, "new.html", changeset: changeset, node_id: node_id, nodes: bot.nodes)
  end

  def create(conn, %{"button" => button_params}) do
    case Bots.create_button(button_params) do
      {:ok, button} ->
        conn
        |> put_flash(:info, "Button created successfully.")
        |> redirect(to: node_path(conn, :show, button.parent_node_id))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    button = Bots.get_button!(id)
    render(conn, "show.html", button: button)
  end

  def edit(conn, %{"id" => id}) do
    button = Bots.get_button!(id)
    changeset = Bots.change_button(button)
    nodes = Bots.list_nodes();
    render(conn, "edit.html", button: button, changeset: changeset, nodes: nodes)
  end

  def update(conn, %{"id" => id, "button" => button_params}) do
    button = Bots.get_button!(id)

    case Bots.update_button(button, button_params) do
      {:ok, button} ->
        conn
        |> put_flash(:info, "Button updated successfully.")
        |> redirect(to: node_path(conn, :show, button.parent_node_id))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", button: button, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    button = Bots.get_button!(id)
    {:ok, _button} = Bots.delete_button(button)

    conn
    |> put_flash(:info, "Button deleted successfully.")
    |> redirect(to: button_path(conn, :index))
  end
end
