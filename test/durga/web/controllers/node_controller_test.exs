defmodule Durga.Web.NodeControllerTest do
  use Durga.Web.ConnCase

  alias Durga.Bots

  @create_attrs %{name: "some name", text: "some text"}
  @update_attrs %{name: "some updated name", text: "some updated text"}
  @invalid_attrs %{name: nil, text: nil}

  def fixture(:node) do
    {:ok, node} = Bots.create_node(@create_attrs)
    node
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, node_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing Nodes"
  end

  test "renders form for new nodes", %{conn: conn} do
    conn = get conn, node_path(conn, :new)
    assert html_response(conn, 200) =~ "New Node"
  end

  test "creates node and redirects to show when data is valid", %{conn: conn} do
    conn = post conn, node_path(conn, :create), node: @create_attrs

    assert %{id: id} = redirected_params(conn)
    assert redirected_to(conn) == node_path(conn, :show, id)

    conn = get conn, node_path(conn, :show, id)
    assert html_response(conn, 200) =~ "Show Node"
  end

  test "does not create node and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, node_path(conn, :create), node: @invalid_attrs
    assert html_response(conn, 200) =~ "New Node"
  end

  test "renders form for editing chosen node", %{conn: conn} do
    node = fixture(:node)
    conn = get conn, node_path(conn, :edit, node)
    assert html_response(conn, 200) =~ "Edit Node"
  end

  test "updates chosen node and redirects when data is valid", %{conn: conn} do
    node = fixture(:node)
    conn = put conn, node_path(conn, :update, node), node: @update_attrs
    assert redirected_to(conn) == node_path(conn, :show, node)

    conn = get conn, node_path(conn, :show, node)
    assert html_response(conn, 200) =~ "some updated name"
  end

  test "does not update chosen node and renders errors when data is invalid", %{conn: conn} do
    node = fixture(:node)
    conn = put conn, node_path(conn, :update, node), node: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit Node"
  end

  test "deletes chosen node", %{conn: conn} do
    node = fixture(:node)
    conn = delete conn, node_path(conn, :delete, node)
    assert redirected_to(conn) == node_path(conn, :index)
    assert_error_sent 404, fn ->
      get conn, node_path(conn, :show, node)
    end
  end
end
