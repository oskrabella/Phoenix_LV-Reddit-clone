defmodule RdditClone.Home.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :username, :string, default: "oscar_abella"
    field :upvote_count, :integer, default: 0
    field :downvote_count, :integer, default: 0

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:body])
    |> validate_required([:body])
    |> validate_length(:body, min: 2, max: 300)
  end
end
