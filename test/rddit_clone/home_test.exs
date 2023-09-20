defmodule RdditClone.HomeTest do
  use RdditClone.DataCase

  alias RdditClone.Home

  describe "posts" do
    alias RdditClone.Home.Post

    import RdditClone.HomeFixtures

    @invalid_attrs %{body: nil, username: nil, upvote_count: nil, downvote_count: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Home.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Home.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{body: "some body", username: "some username", upvote_count: 42, downvote_count: 42}

      assert {:ok, %Post{} = post} = Home.create_post(valid_attrs)
      assert post.body == "some body"
      assert post.username == "some username"
      assert post.upvote_count == 42
      assert post.downvote_count == 42
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Home.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = %{body: "some updated body", username: "some updated username", upvote_count: 43, downvote_count: 43}

      assert {:ok, %Post{} = post} = Home.update_post(post, update_attrs)
      assert post.body == "some updated body"
      assert post.username == "some updated username"
      assert post.upvote_count == 43
      assert post.downvote_count == 43
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Home.update_post(post, @invalid_attrs)
      assert post == Home.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Home.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Home.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Home.change_post(post)
    end
  end
end
