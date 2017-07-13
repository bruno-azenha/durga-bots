defmodule Durga.Repo.Migrations.CreateDurga.Bots.Node do
  use Ecto.Migration

  def change do
    create table(:bots_nodes) do
      add :text, :string, size: 2040

      timestamps()
    end

  end
end
