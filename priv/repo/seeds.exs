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
  %Node{name: "Node 0", text: "Node 0 Loren Ipsun Somet...", bot_id: bot.id},
  %Node{name: "Node 1", text: "Node 1 Loren Ipsun Somet...", bot_id: bot.id},
  %Node{name: "Node 2", text: "Node 2 Loren Ipsun Somet...", bot_id: bot.id},
  %Node{name: "Node 3", text: "Node 3 Loren Ipsun Somet...", bot_id: bot.id},
  %Node{name: "Node 4", text: "Node 4 Loren Ipsun Somet...", bot_id: bot.id},
  %Node{name: "Node 5", text: "Node 5 Loren Ipsun Somet...", bot_id: bot.id},
  %Node{name: "Node 6", text: "Node 6 Loren Ipsun Somet...", bot_id: bot.id},
  %Node{name: "Node 7", text: "Node 7 Loren Ipsun Somet...", bot_id: bot.id},
  %Node{name: "Node 8", text: "Node 8 Loren Ipsun Somet...", bot_id: bot.id},
  %Node{name: "Node 9", text: "Node 9 Loren Ipsun Somet...", bot_id: bot.id},
] |> Enum.map(&(Repo.insert!(&1)))

bot
|> Ecto.Changeset.change(first_node_id: 1)
|> Repo.insert_or_update!()

_buttons = [
  %Button{text: "Button 1", parent_node_id: Enum.at(nodes, 0).id, target_node_id: Enum.at(nodes, 1).id},
  %Button{text: "Button 2", parent_node_id: Enum.at(nodes, 0).id, target_node_id: Enum.at(nodes, 2).id},
  %Button{text: "Button 3", parent_node_id: Enum.at(nodes, 1).id, target_node_id: Enum.at(nodes, 3).id},
  %Button{text: "Button 4", parent_node_id: Enum.at(nodes, 1).id, target_node_id: Enum.at(nodes, 4).id},
  %Button{text: "Button 5", parent_node_id: Enum.at(nodes, 2).id, target_node_id: Enum.at(nodes, 5).id},
  %Button{text: "Button 6", parent_node_id: Enum.at(nodes, 2).id, target_node_id: Enum.at(nodes, 6).id},
  %Button{text: "Button 7", parent_node_id: Enum.at(nodes, 3).id, target_node_id: Enum.at(nodes, 7).id},
  %Button{text: "Button 8", parent_node_id: Enum.at(nodes, 3).id, target_node_id: Enum.at(nodes, 8).id},
  %Button{text: "Button 9", parent_node_id: Enum.at(nodes, 3).id, target_node_id: Enum.at(nodes, 9).id},
] |> Enum.map(&(Repo.insert!(&1)))
