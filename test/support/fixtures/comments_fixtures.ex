defmodule LiveStateComments.CommentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveStateComments.Comments` context.
  """

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        author: "some author",
        text: "some text",
        url: "some url"
      })
      |> LiveStateComments.Comments.create_comment()

    comment
  end
end
