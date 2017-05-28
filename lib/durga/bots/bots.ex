defmodule Durga.Bots do
  @moduledoc """
  The boundary for the Bots system.
  """

  import Ecto.Query, warn: false
  alias Durga.Repo

  alias Durga.Bots.Bot

  @doc """
  Returns the list of bots.

  ## Examples

      iex> list_bots()
      [%Bot{}, ...]

  """
  def list_bots do
    Repo.all(Bot)
  end

  @doc """
  Gets a single bot.

  Raises `Ecto.NoResultsError` if the Bot does not exist.

  ## Examples

      iex> get_bot!(123)
      %Bot{}

      iex> get_bot!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bot!(id), do: Repo.get!(Bot, id)

  @doc """
  Creates a bot.

  ## Examples

      iex> create_bot(%{field: value})
      {:ok, %Bot{}}

      iex> create_bot(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bot(attrs \\ %{}) do
    %Bot{}
    |> Bot.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bot.

  ## Examples

      iex> update_bot(bot, %{field: new_value})
      {:ok, %Bot{}}

      iex> update_bot(bot, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bot(%Bot{} = bot, attrs) do
    bot
    |> Bot.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Bot.

  ## Examples

      iex> delete_bot(bot)
      {:ok, %Bot{}}

      iex> delete_bot(bot)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bot(%Bot{} = bot) do
    Repo.delete(bot)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bot changes.

  ## Examples

      iex> change_bot(bot)
      %Ecto.Changeset{source: %Bot{}}

  """
  def change_bot(%Bot{} = bot) do
    Bot.changeset(bot, %{})
  end

  alias Durga.Bots.Node

  @doc """
  Returns the list of nodes.

  ## Examples

      iex> list_nodes()
      [%Node{}, ...]

  """
  def list_nodes do
    Repo.all(Node)
  end

  @doc """
  Gets a single node.

  Raises `Ecto.NoResultsError` if the Node does not exist.

  ## Examples

      iex> get_node!(123)
      %Node{}

      iex> get_node!(456)
      ** (Ecto.NoResultsError)

  """
  def get_node!(id), do: Repo.get!(Node, id)

  @doc """
  Creates a node.

  ## Examples

      iex> create_node(%{field: value})
      {:ok, %Node{}}

      iex> create_node(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_node(attrs \\ %{}) do
    %Node{}
    |> Node.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a node.

  ## Examples

      iex> update_node(node, %{field: new_value})
      {:ok, %Node{}}

      iex> update_node(node, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_node(%Node{} = node, attrs) do
    node
    |> Node.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Node.

  ## Examples

      iex> delete_node(node)
      {:ok, %Node{}}

      iex> delete_node(node)
      {:error, %Ecto.Changeset{}}

  """
  def delete_node(%Node{} = node) do
    Repo.delete(node)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking node changes.

  ## Examples

      iex> change_node(node)
      %Ecto.Changeset{source: %Node{}}

  """
  def change_node(%Node{} = node) do
    Node.changeset(node, %{})
  end

  alias Durga.Bots.Button

  @doc """
  Returns the list of buttons.

  ## Examples

      iex> list_buttons()
      [%Button{}, ...]

  """
  def list_buttons do
    Repo.all(Button)
  end

  @doc """
  Gets a single button.

  Raises `Ecto.NoResultsError` if the Button does not exist.

  ## Examples

      iex> get_button!(123)
      %Button{}

      iex> get_button!(456)
      ** (Ecto.NoResultsError)

  """
  def get_button!(id), do: Repo.get!(Button, id)

  @doc """
  Creates a button.

  ## Examples

      iex> create_button(%{field: value})
      {:ok, %Button{}}

      iex> create_button(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_button(attrs \\ %{}) do
    %Button{}
    |> Button.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a button.

  ## Examples

      iex> update_button(button, %{field: new_value})
      {:ok, %Button{}}

      iex> update_button(button, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_button(%Button{} = button, attrs) do
    button
    |> Button.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Button.

  ## Examples

      iex> delete_button(button)
      {:ok, %Button{}}

      iex> delete_button(button)
      {:error, %Ecto.Changeset{}}

  """
  def delete_button(%Button{} = button) do
    Repo.delete(button)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking button changes.

  ## Examples

      iex> change_button(button)
      %Ecto.Changeset{source: %Button{}}

  """
  def change_button(%Button{} = button) do
    Button.changeset(button, %{})
  end
end
