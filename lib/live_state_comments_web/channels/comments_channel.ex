defmodule LiveStateCommentsWeb.CommentsChannel do
  use LiveState.Channel, web_module: LiveStateCommentsWeb

  alias LiveStateComments.Comments
  alias LiveState.Event

  @impl true
  def state_key, do: :state

  @impl true
  @spec init(any, any, any) :: {:ok, %{comments: any}}
  def init("comments:" <> url, _params, _socket) do
    Phoenix.PubSub.subscribe(LiveStateComments.PubSub, "comments:#{url}")
    {:ok, %{comments: Comments.list_comments(url), url: url}}
  end

  @impl true
  def handle_event("add_comment", comment_params, %{comments: comments} = state) do
    case Comments.create_comment(comment_params) do
      {:ok, comment} ->
        new_state = Map.put(state, :comments, comments ++ [comment])
        {:reply, [%Event{name: "comment_added", detail: comment}], new_state}
    end
  end

  @impl true
  def handle_message({:comment_created, _comment}, state) do
    {:noreply, state |> Map.put(:comments, Comments.list_comments(state.url))}
  end
end
