defmodule RdditClone.Home.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :username, :string
    field :upvote_count, :integer
    field :downvote_count, :integer

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:username, :body, :upvote_count, :downvote_count])
    |> validate_required([:username, :body, :upvote_count, :downvote_count])
  end
end
