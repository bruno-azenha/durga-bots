defmodule Durga.Repo.Migrations.CreateDurga.Bots.Node do
  use Ecto.Migration

  def change do
    create table(:bots_nodes) do
      add :name, :string
      add :text, :string

      timestamps()
    end

  end
end
