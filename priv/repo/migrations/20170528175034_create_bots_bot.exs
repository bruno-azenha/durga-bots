defmodule Durga.Repo.Migrations.CreateDurga.Bots.Bot do
  use Ecto.Migration

  def change do
    create table(:bots_bots) do
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end
