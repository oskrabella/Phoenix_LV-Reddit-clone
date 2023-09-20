defmodule RdditCloneWeb.PostLive.Index do
  use RdditCloneWeb, :live_view

  alias RdditClone.Home
  alias RdditClone.Home.Post

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :posts, Home.list_posts())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Post")
    |> assign(:post, Home.get_post!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Post")
    |> assign(:post, %Post{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Posts")
    |> assign(:post, nil)
  end

  @impl true
  def handle_info({RdditCloneWeb.PostLive.FormComponent, {:saved, post}}, socket) do
    {:noreply, stream_insert(socket, :posts, post)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    post = Home.get_post!(id)
    {:ok, _} = Home.delete_post(post)

    {:noreply, stream_delete(socket, :posts, post)}
  end
end
