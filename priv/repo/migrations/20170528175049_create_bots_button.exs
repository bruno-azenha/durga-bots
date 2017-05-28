defmodule Durga.Repo.Migrations.CreateDurga.Bots.Button do
  use Ecto.Migration

  def change do
    create table(:bots_buttons) do
      add :text, :string

      timestamps()
    end

  end
end
