defmodule RdditClone.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :username, :string
      add :body, :string
      add :upvote_count, :integer
      add :downvote_count, :integer

      timestamps()
    end
  end
end
