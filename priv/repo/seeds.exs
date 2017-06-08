# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Durga.Repo.insert!(%Durga.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Durga.Repo
alias Durga.Bots.{Bot, Node, Button}

# Starts Garuda.Repo
Durga.Repo.start_link()

bot =
  %Bot{description: "Sample description", name: "Sample Bot Name"}
  |> Repo.insert!()

nodes = [
  %Node{text: "Node 0 Loren Ipsun Somet...", bot_id: bot.id},
  %Node{text: "Node 1 Loren Ipsun Somet...", bot_id: bot.id},
  %Node{text: "Node 2 Loren Ipsun Somet...", bot_id: bot.id},
  %Node{text: "Node 3 Loren Ipsun Somet...", bot_id: bot.id},
  %Node{text: "Node 4 Loren Ipsun Somet...", bot_id: bot.id},
  %Node{text: "Node 5 Loren Ipsun Somet...", bot_id: bot.id},
  %Node{text: "Node 6 Loren Ipsun Somet...", bot_id: bot.id},
  %Node{text: "Node 7 Loren Ipsun Somet...", bot_id: bot.id},
  %Node{text: "Node 8 Loren Ipsun Somet...", bot_id: bot.id},
  %Node{text: "Node 9 Loren Ipsun Somet...", bot_id: bot.id},
] |> Enum.map(&(Repo.insert!(&1)))

bot
|> Ecto.Changeset.change(first_node_id: 1)
|> Repo.insert_or_update!()

_buttons = [
  %Button{text: "First Button", parent_node_id: Enum.at(nodes, 0).id, target_node_id: Enum.at(nodes, 1).id},
  %Button{text: "Second Button", parent_node_id: Enum.at(nodes, 0).id, target_node_id: Enum.at(nodes, 2).id},
  %Button{text: "Third Button", parent_node_id: Enum.at(nodes, 1).id, target_node_id: Enum.at(nodes, 3).id},
  %Button{text: "Fourth Button", parent_node_id: Enum.at(nodes, 1).id, target_node_id: Enum.at(nodes, 4).id},
  %Button{text: "Fifth Button", parent_node_id: Enum.at(nodes, 2).id, target_node_id: Enum.at(nodes, 5).id},
  %Button{text: "Sixth Button", parent_node_id: Enum.at(nodes, 2).id, target_node_id: Enum.at(nodes, 6).id},
  %Button{text: "Seventh Button", parent_node_id: Enum.at(nodes, 3).id, target_node_id: Enum.at(nodes, 7).id},
  %Button{text: "Eighth Button", parent_node_id: Enum.at(nodes, 3).id, target_node_id: Enum.at(nodes, 8).id},
  %Button{text: "Ninth Button", parent_node_id: Enum.at(nodes, 3).id, target_node_id: Enum.at(nodes, 9).id},
] |> Enum.map(&(Repo.insert!(&1)))
