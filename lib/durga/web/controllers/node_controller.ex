defmodule Durga.Web.NodeController do
  use Durga.Web, :controller

  alias Durga.Bots

  def index(conn, _params) do
    nodes = Bots.list_nodes()
    render(conn, "index.html", nodes: nodes)
  end

  def new(conn, _params) do
    changeset = Bots.change_node(%Durga.Bots.Node{})
    bots = Bots.list_bots()
    render(conn, "new.html", changeset: changeset, bots: bots)
  end

  def create(conn, %{"node" => node_params}) do
    case Bots.create_node(node_params) do
      {:ok, node} ->
        conn
        |> put_flash(:info, "Node created successfully.")
        |> redirect(to: node_path(conn, :show, node))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    node = Bots.get_node!(id)
    render(conn, "show.html", node: node)
  end

  def edit(conn, %{"id" => id}) do
    node = Bots.get_node!(id)
    changeset = Bots.change_node(node)
    bots = Bots.list_bots()
    render(conn, "edit.html", node: node, changeset: changeset, bots: bots)
  end

  def update(conn, %{"id" => id, "node" => node_params}) do
    node = Bots.get_node!(id)

    case Bots.update_node(node, node_params) do
      {:ok, node} ->
        conn
        |> put_flash(:info, "Node updated successfully.")
        |> redirect(to: node_path(conn, :show, node))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", node: node, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    node = Bots.get_node!(id)
    {:ok, _node} = Bots.delete_node(node)

    conn
    |> put_flash(:info, "Node deleted successfully.")
    |> redirect(to: node_path(conn, :index))
  end
end
