defmodule Durga.Bots.Bot do
  use Ecto.Schema
  import Ecto.Changeset
  alias Durga.Bots.Bot
  alias Durga.Bots.Node


  schema "bots_bots" do
    field :description, :string
    field :name, :string

    belongs_to :first_node, Node
    has_many :nodes, Node
    timestamps()
  end

  @doc false
  def changeset(%Bot{} = bot, attrs) do
    bot
    |> cast(attrs, [:name, :description, :first_node])
    |> validate_required([:name, :description])
  end
end
