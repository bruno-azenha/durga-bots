defmodule Durga.Bots.Button do
  use Ecto.Schema
  import Ecto.Changeset
  alias Durga.Bots.Button
  alias Durga.Bots.Node


  schema "bots_buttons" do
    field :text, :string

    belongs_to :parent_node, Node
    belongs_to :target_node, Node
    timestamps()
  end

  @doc false
  def changeset(%Button{} = button, attrs) do
    button
    |> cast(attrs, [:text, :parent_node_id, :target_node_id])
    |> validate_required([:text])
  end
end
