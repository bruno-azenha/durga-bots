defmodule Durga.Repo.Migrations.AddReferencingFieldsToBotsNodesAndButtons do
  use Ecto.Migration

  def change do
    alter table(:bots_bots) do
      add :first_node_id, references(:bots_nodes)
    end

    alter table(:bots_nodes) do
      add :bot_id, references(:bots_bots)
    end

    alter table(:bots_buttons) do
      add :parent_node_id, references(:bots_nodes)
      add :target_node_id, references(:bots_nodes)
    end
  end
end
