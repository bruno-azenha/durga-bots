defmodule Durga.Bots.Node do
  use Ecto.Schema
  import Ecto.Changeset
  alias Durga.Bots.Node
  alias Durga.Bots.Bot
  alias Durga.Bots.Button


  schema "bots_nodes" do
    field :name, :string
    field :text, :string

    belongs_to :bot, Bot
    has_many :buttons, Button
    timestamps()
  end

  @doc false
  def changeset(%Node{} = node, attrs) do
    node
    |> cast(attrs, [:name, :text])
    |> validate_required([:name, :text])
  end
end
