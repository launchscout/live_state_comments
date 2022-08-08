defmodule LiveStateComments.Comments.CommentEmail do
  import Swoosh.Email

  alias LiveStateComments.Comments.Comment

  def comment_added(%Comment{url: url, text: text, author: author}) do
    new()
    |> to({"LiveState Comments", "blog-comments@gaslight.co"})
    |> from({"Comment Sender", "chris+mailgun@gaslight.co"})
    |> subject("New Comment added")
    |> text_body """
    A new comment by #{author} was added for #{url}

    Comment: #{text}
    """
  end
end
