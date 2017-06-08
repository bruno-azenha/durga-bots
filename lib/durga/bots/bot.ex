defmodule Durga.Bots.Bot do
  use Ecto.Schema
  import Ecto.Changeset
  alias Durga.Bots.Bot
  alias Durga.Bots.Node

  @derive {Poison.Encoder, except: [:__meta__, :inserted_at, :updated_at]}

  schema "bots_bots" do
    field :description, :string
    field :name, :string

    belongs_to :first_node, Node
    has_many :nodes, Node, on_delete: :delete_all
    timestamps()
  end

  @doc false
  def changeset(%Bot{} = bot, attrs) do
    bot
    |> cast(attrs, [:name, :description, :first_node_id])
    |> validate_required([:name])
  end
end
