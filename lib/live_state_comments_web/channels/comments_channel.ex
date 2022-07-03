defmodule LiveStateCommentsWeb.CommentsChannel do
  use LiveState.Channel, web_module: LiveStateCommentsWeb

  alias LiveStateComments.Repo
  alias LiveStateComments.Comments
  alias LiveState.Event

  @impl true
  def state_key, do: "state"

  @impl true
  def init(_socket) do
    Phoenix.PubSub.subscribe(LiveStateComments.PubSub, "comments")
    {:ok, %{comments: Comments.list_comments()}}
  end

  @impl true
  def handle_event("add_comment", comment_params, %{comments: comments}) do
    case Comments.create_comment(comment_params) do
      {:ok, comment} ->
        {:reply, [%Event{name: "comment_added", detail: comment}], %{comments: comments ++ [comment]}}
    end
  end

  @impl true
  def handle_message({:comment_created, _comment}, state) do
    {:ok, state |> Map.put(:comments, Comments.list_comments())}
  end
end
