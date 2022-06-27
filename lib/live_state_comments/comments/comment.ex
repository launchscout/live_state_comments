defmodule LiveStateComments.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  @derive {Jason.Encoder, only: [:author, :text, :url, :inserted_at]}

  schema "comments" do
    field :author, :string
    field :text, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:author, :url, :text])
    |> validate_required([:author, :url, :text])
  end
end
