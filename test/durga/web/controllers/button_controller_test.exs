defmodule Durga.Web.ButtonControllerTest do
  use Durga.Web.ConnCase

  alias Durga.Bots

  @create_attrs %{text: "some text"}
  @update_attrs %{text: "some updated text"}
  @invalid_attrs %{text: nil}

  def fixture(:button) do
    {:ok, button} = Bots.create_button(@create_attrs)
    button
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, button_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing Buttons"
  end

  test "renders form for new buttons", %{conn: conn} do
    conn = get conn, button_path(conn, :new)
    assert html_response(conn, 200) =~ "New Button"
  end

  test "creates button and redirects to show when data is valid", %{conn: conn} do
    conn = post conn, button_path(conn, :create), button: @create_attrs

    assert %{id: id} = redirected_params(conn)
    assert redirected_to(conn) == button_path(conn, :show, id)

    conn = get conn, button_path(conn, :show, id)
    assert html_response(conn, 200) =~ "Show Button"
  end

  test "does not create button and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, button_path(conn, :create), button: @invalid_attrs
    assert html_response(conn, 200) =~ "New Button"
  end

  test "renders form for editing chosen button", %{conn: conn} do
    button = fixture(:button)
    conn = get conn, button_path(conn, :edit, button)
    assert html_response(conn, 200) =~ "Edit Button"
  end

  test "updates chosen button and redirects when data is valid", %{conn: conn} do
    button = fixture(:button)
    conn = put conn, button_path(conn, :update, button), button: @update_attrs
    assert redirected_to(conn) == button_path(conn, :show, button)

    conn = get conn, button_path(conn, :show, button)
    assert html_response(conn, 200) =~ "some updated text"
  end

  test "does not update chosen button and renders errors when data is invalid", %{conn: conn} do
    button = fixture(:button)
    conn = put conn, button_path(conn, :update, button), button: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit Button"
  end

  test "deletes chosen button", %{conn: conn} do
    button = fixture(:button)
    conn = delete conn, button_path(conn, :delete, button)
    assert redirected_to(conn) == button_path(conn, :index)
    assert_error_sent 404, fn ->
      get conn, button_path(conn, :show, button)
    end
  end
end
