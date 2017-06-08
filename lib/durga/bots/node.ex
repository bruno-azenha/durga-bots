defmodule Durga.Bots.Node do
  use Ecto.Schema
  import Ecto.Changeset
  alias Durga.Bots.Node
  alias Durga.Bots.Bot
  alias Durga.Bots.Button

  @derive {Poison.Encoder, except: [:__meta__, :inserted_at, :updated_at, :bot]}

  schema "bots_nodes" do
    field :text, :string

    has_one :is_first_node_of, Bot, foreign_key: :first_node_id, on_delete: :nilify
    belongs_to :bot, Bot
    has_many :buttons, Button, foreign_key: :parent_node_id, on_delete: :delete_all
    timestamps()
  end

  @doc false
  def changeset(%Node{} = node, attrs) do
    node
    |> cast(attrs, [:text, :bot_id])
    |> validate_required([:text])
  end
end
