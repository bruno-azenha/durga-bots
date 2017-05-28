defmodule Durga.BotsTest do
  use Durga.DataCase

  alias Durga.Bots

  describe "bots" do
    alias Durga.Bots.Bot

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def bot_fixture(attrs \\ %{}) do
      {:ok, bot} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Bots.create_bot()

      bot
    end

    test "list_bots/0 returns all bots" do
      bot = bot_fixture()
      assert Bots.list_bots() == [bot]
    end

    test "get_bot!/1 returns the bot with given id" do
      bot = bot_fixture()
      assert Bots.get_bot!(bot.id) == bot
    end

    test "create_bot/1 with valid data creates a bot" do
      assert {:ok, %Bot{} = bot} = Bots.create_bot(@valid_attrs)
      assert bot.description == "some description"
      assert bot.name == "some name"
    end

    test "create_bot/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bots.create_bot(@invalid_attrs)
    end

    test "update_bot/2 with valid data updates the bot" do
      bot = bot_fixture()
      assert {:ok, bot} = Bots.update_bot(bot, @update_attrs)
      assert %Bot{} = bot
      assert bot.description == "some updated description"
      assert bot.name == "some updated name"
    end

    test "update_bot/2 with invalid data returns error changeset" do
      bot = bot_fixture()
      assert {:error, %Ecto.Changeset{}} = Bots.update_bot(bot, @invalid_attrs)
      assert bot == Bots.get_bot!(bot.id)
    end

    test "delete_bot/1 deletes the bot" do
      bot = bot_fixture()
      assert {:ok, %Bot{}} = Bots.delete_bot(bot)
      assert_raise Ecto.NoResultsError, fn -> Bots.get_bot!(bot.id) end
    end

    test "change_bot/1 returns a bot changeset" do
      bot = bot_fixture()
      assert %Ecto.Changeset{} = Bots.change_bot(bot)
    end
  end

  describe "nodes" do
    alias Durga.Bots.Node

    @valid_attrs %{name: "some name", text: "some text"}
    @update_attrs %{name: "some updated name", text: "some updated text"}
    @invalid_attrs %{name: nil, text: nil}

    def node_fixture(attrs \\ %{}) do
      {:ok, node} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Bots.create_node()

      node
    end

    test "list_nodes/0 returns all nodes" do
      node = node_fixture()
      assert Bots.list_nodes() == [node]
    end

    test "get_node!/1 returns the node with given id" do
      node = node_fixture()
      assert Bots.get_node!(node.id) == node
    end

    test "create_node/1 with valid data creates a node" do
      assert {:ok, %Node{} = node} = Bots.create_node(@valid_attrs)
      assert node.name == "some name"
      assert node.text == "some text"
    end

    test "create_node/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bots.create_node(@invalid_attrs)
    end

    test "update_node/2 with valid data updates the node" do
      node = node_fixture()
      assert {:ok, node} = Bots.update_node(node, @update_attrs)
      assert %Node{} = node
      assert node.name == "some updated name"
      assert node.text == "some updated text"
    end

    test "update_node/2 with invalid data returns error changeset" do
      node = node_fixture()
      assert {:error, %Ecto.Changeset{}} = Bots.update_node(node, @invalid_attrs)
      assert node == Bots.get_node!(node.id)
    end

    test "delete_node/1 deletes the node" do
      node = node_fixture()
      assert {:ok, %Node{}} = Bots.delete_node(node)
      assert_raise Ecto.NoResultsError, fn -> Bots.get_node!(node.id) end
    end

    test "change_node/1 returns a node changeset" do
      node = node_fixture()
      assert %Ecto.Changeset{} = Bots.change_node(node)
    end
  end

  describe "buttons" do
    alias Durga.Bots.Button

    @valid_attrs %{text: "some text"}
    @update_attrs %{text: "some updated text"}
    @invalid_attrs %{text: nil}

    def button_fixture(attrs \\ %{}) do
      {:ok, button} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Bots.create_button()

      button
    end

    test "list_buttons/0 returns all buttons" do
      button = button_fixture()
      assert Bots.list_buttons() == [button]
    end

    test "get_button!/1 returns the button with given id" do
      button = button_fixture()
      assert Bots.get_button!(button.id) == button
    end

    test "create_button/1 with valid data creates a button" do
      assert {:ok, %Button{} = button} = Bots.create_button(@valid_attrs)
      assert button.text == "some text"
    end

    test "create_button/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bots.create_button(@invalid_attrs)
    end

    test "update_button/2 with valid data updates the button" do
      button = button_fixture()
      assert {:ok, button} = Bots.update_button(button, @update_attrs)
      assert %Button{} = button
      assert button.text == "some updated text"
    end

    test "update_button/2 with invalid data returns error changeset" do
      button = button_fixture()
      assert {:error, %Ecto.Changeset{}} = Bots.update_button(button, @invalid_attrs)
      assert button == Bots.get_button!(button.id)
    end

    test "delete_button/1 deletes the button" do
      button = button_fixture()
      assert {:ok, %Button{}} = Bots.delete_button(button)
      assert_raise Ecto.NoResultsError, fn -> Bots.get_button!(button.id) end
    end

    test "change_button/1 returns a button changeset" do
      button = button_fixture()
      assert %Ecto.Changeset{} = Bots.change_button(button)
    end
  end
end
