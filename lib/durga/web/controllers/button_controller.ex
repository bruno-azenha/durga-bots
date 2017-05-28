defmodule Durga.Web.ButtonController do
  use Durga.Web, :controller

  alias Durga.Bots

  def index(conn, _params) do
    buttons = Bots.list_buttons()
    render(conn, "index.html", buttons: buttons)
  end

  def new(conn, _params) do
    changeset = Bots.change_button(%Durga.Bots.Button{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"button" => button_params}) do
    case Bots.create_button(button_params) do
      {:ok, button} ->
        conn
        |> put_flash(:info, "Button created successfully.")
        |> redirect(to: button_path(conn, :show, button))
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
    render(conn, "edit.html", button: button, changeset: changeset)
  end

  def update(conn, %{"id" => id, "button" => button_params}) do
    button = Bots.get_button!(id)

    case Bots.update_button(button, button_params) do
      {:ok, button} ->
        conn
        |> put_flash(:info, "Button updated successfully.")
        |> redirect(to: button_path(conn, :show, button))
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
