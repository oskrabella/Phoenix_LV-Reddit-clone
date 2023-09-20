defmodule RdditClone.HomeFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RdditClone.Home` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        body: "some body",
        username: "some username",
        upvote_count: 42,
        downvote_count: 42
      })
      |> RdditClone.Home.create_post()

    post
  end
end
