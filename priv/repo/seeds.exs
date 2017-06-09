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
  %Bot{description: "Sample description", name: "Bradesco-Seguros"}
  |> Repo.insert!()

nodes = [
  %Node{text: "Olá, Marcelo! Sabemos que acidentes acontecem e problemas de saúde são imprevisíveis. Por isso, preparamos uma oferta exclusiva para você viajar com segurança! Escolha uma das opções abaixo:", bot_id: bot.id},
  %Node{text: "Achamos que o plano aventureiro é perfeito para você! Com uma mensalidade de R$500,00, você fica assegurado contra extravio de bagagem e garantimos as menores tarifas em vôos internacionais.", bot_id: bot.id},
  %Node{text: "Marcelo, o seguro aventureiro foi contratado com sucesso! Agora você pode viajar muito mais tranquilo.", bot_id: bot.id},
  %Node{text: "Marcelo, o seguro caseiro foi contratado com sucesso! Agora você pode ficar em casa com muito mais segurança.", bot_id: bot.id},
  %Node{text: "Achamos que o Plano Caseiro é perfeito para você! Com uma mensalidade de R$500,00, você fica assegurado contra custos de manutenção de eletrodomésticos e garantimos as menores tarifas em serviços do lar.", bot_id: bot.id},
  %Node{text: "Quem sabe da próxima vez?", bot_id: bot.id}
] |> Enum.map(&(Repo.insert!(&1)))

bot
|> Ecto.Changeset.change(first_node_id: Enum.at(nodes, 0).id)
|> Repo.insert_or_update!()

_buttons = [
  %Button{text: "Quero viajar", parent_node_id: Enum.at(nodes, 0).id, target_node_id: Enum.at(nodes, 1).id},
  %Button{text: "Não quero viajar", parent_node_id: Enum.at(nodes, 0).id, target_node_id: Enum.at(nodes, 4).id},
  %Button{text: "Contratar", parent_node_id: Enum.at(nodes, 1).id, target_node_id: Enum.at(nodes, 2).id},
  %Button{text: "Agora não", parent_node_id: Enum.at(nodes, 1).id, target_node_id: Enum.at(nodes, 5).id},
  %Button{text: "Contratar", parent_node_id: Enum.at(nodes, 4).id, target_node_id: Enum.at(nodes, 3).id},
  %Button{text: "Agora não", parent_node_id: Enum.at(nodes, 4).id, target_node_id: Enum.at(nodes, 5).id}
] |> Enum.map(&(Repo.insert!(&1)))
