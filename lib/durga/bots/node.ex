defmodule Durga.Bots.Node do
  use Ecto.Schema
  import Ecto.Changeset
  alias Durga.Bots.Node
  alias Durga.Bots.Bot
  alias Durga.Bots.Button

  @derive {Poison.Encoder, except: [:__meta__, :inserted_at, :updated_at, :bot]}

  schema "bots_nodes" do
    field :name, :string
    field :text, :string

    belongs_to :bot, Bot
    has_many :buttons, Button, foreign_key: :parent_node_id
    timestamps()
  end

  @doc false
  def changeset(%Node{} = node, attrs) do
    node
    |> cast(attrs, [:name, :text, :bot_id])
    |> validate_required([:name, :text])
  end
end
