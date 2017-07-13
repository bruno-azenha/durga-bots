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

bot_easy_invest =
  %Bot{description: "Easy Invest Bot", name: "Easy Invest Bot"}
  |> Repo.insert!()

nodes_easy_invest = [
  %Node{text: "Quer investir e não sabe por onde começar? Saiba como abrir uma conta na Easynvest!", bot_id: bot_easy_invest.id},
  %Node{text: "Tire suas dúvidas de como abrir uma conta. Clique nas opções abaixo", bot_id: bot_easy_invest.id},
  %Node{text: "Todo o cadastro é feito online e leva alguns minutos. Você pode fazer pelo nosso site ou pelo aplicativo Easynvest (IOS ou Android).", bot_id: bot_easy_invest.id},
  %Node{text: "www.easynvest.com.br/precadastro", bot_id: bot_easy_invest.id},
  %Node{text: "https://itunes.apple.com/br/app/easynvest-renda-fixa/id1065904944?mt=8", bot_id: bot_easy_invest.id},
  %Node{text: "https://play.google.com/store/apps/details?id=com.denke.easynvest&hl=pt-br", bot_id: bot_easy_invest.id},
  %Node{text: "Não é possível ter conta conjunta na Easynvest. Toda conta possui um único CPF na Easynvest. Mas nada impede que tenha e transfira recursos de sua conta conjunta do seu banco para a sua conta (seu CPF) na Easynvest.", bot_id: bot_easy_invest.id},
  %Node{text: "As restrições em qualquer órgão de avaliação de crédito (Serasa e SPC) não são impeditivos para abrir uma conta para investimentos.", bot_id: bot_easy_invest.id},
  %Node{text: "Mesmo sendo estrangeiro, você pode abrir uma conta desde que se enquadre nas regras abaixo: Possua residência fixa no Brasil; Seja tributado aqui no Brasil, ou seja, tenha declarado Imposto de Renda no último ano. Se esses critérios forem atendidos, o procedimento para abertura de conta é igual ao de qualquer outro investidor.", bot_id: bot_easy_invest.id},
  %Node{text: "Para abertura de conta para menor de idade, basta realizar o cadastro normalmente no site, ou via aplicativo Easynvest Renda Fixa, porém, em nome do menor. Após o preenchimento do cadastro, basta nos enviar os seguintes documentos: - Foto do documento de identificação do Representante Legal dentro da validade e com expedição máxima de 10 anos (frente e verso); - Foto do documento de identificação do menor dentro da validade e com expedição máxima de 10 anos (frente e verso); - Foto do comprovante de residência Conta de Luz, Água, Gás, Telefone (fixo ou móvel)/ Internet/TV a cabo, fatura de cartão de crédito, extrato bancário (exceto de FGTS) com data de emissão máxima de 6 meses em nome do menor ou do Representante Legal. Estes documentos devem ser enviados através do Portal Easynvest (upload), aplicativo Easynvest Renda Fixa ou via e-mail easynvest@easynvest.com.br", bot_id: bot_easy_invest.id}
] |> Enum.map(&(Repo.insert!(&1)))

_buttons_easy_invest = [
  %Button{text: "Abrir uma conta", parent_node_id: Enum.at(nodes_easy_invest, 0).id, target_node_id: Enum.at(nodes_easy_invest, 2).id},
  %Button{text: "Tirar dúvidas", parent_node_id: Enum.at(nodes_easy_invest, 0).id, target_node_id: Enum.at(nodes_easy_invest, 1).id},
  %Button{text: "Cadastrar pelo site", parent_node_id: Enum.at(nodes_easy_invest, 2).id, target_node_id: Enum.at(nodes_easy_invest, 3).id},
  %Button{text: "Baixar aplicativo iOS", parent_node_id: Enum.at(nodes_easy_invest, 2).id, target_node_id: Enum.at(nodes_easy_invest, 4).id},
  %Button{text: "Baixar aplicativo Android", parent_node_id: Enum.at(nodes_easy_invest, 2).id, target_node_id: Enum.at(nodes_easy_invest, 5).id},
  %Button{text: "Posso abrir uma conta conjunta?", parent_node_id: Enum.at(nodes_easy_invest, 1).id, target_node_id: Enum.at(nodes_easy_invest, 6).id},
  %Button{text: "Tenho restrições em meu nome", parent_node_id: Enum.at(nodes_easy_invest, 1).id, target_node_id: Enum.at(nodes_easy_invest, 7).id},
  %Button{text: "Sou estrangeiro", parent_node_id: Enum.at(nodes_easy_invest, 1).id, target_node_id: Enum.at(nodes_easy_invest, 8).id},
  %Button{text: "Sou menor de idade", parent_node_id: Enum.at(nodes_easy_invest, 1).id, target_node_id: Enum.at(nodes_easy_invest, 9).id},
  %Button{text: "Voltar", parent_node_id: Enum.at(nodes_easy_invest, 6).id, target_node_id: Enum.at(nodes_easy_invest, 1).id},
  %Button{text: "Voltar", parent_node_id: Enum.at(nodes_easy_invest, 7).id, target_node_id: Enum.at(nodes_easy_invest, 1).id},
  %Button{text: "Voltar", parent_node_id: Enum.at(nodes_easy_invest, 8).id, target_node_id: Enum.at(nodes_easy_invest, 1).id},
  %Button{text: "Voltar", parent_node_id: Enum.at(nodes_easy_invest, 9).id, target_node_id: Enum.at(nodes_easy_invest, 1).id}
] |> Enum.map(&(Repo.insert!(&1)))

bot_easy_invest
|> Ecto.Changeset.change(first_node_id: Enum.at(nodes_easy_invest, 0).id)
|> Repo.insert_or_update!()
