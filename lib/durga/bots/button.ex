defmodule Durga.Bots.Button do
  use Ecto.Schema
  import Ecto.Changeset
  alias Durga.Bots.Button
  alias Durga.Bots.Node


  schema "bots_buttons" do
    field :text, :string

    has_one :target_node, Node
    timestamps()
  end

  @doc false
  def changeset(%Button{} = button, attrs) do
    button
    |> cast(attrs, [:text])
    |> validate_required([:text])
  end
end
