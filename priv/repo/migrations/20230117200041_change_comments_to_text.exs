defmodule LiveStateComments.Repo.Migrations.ChangeCommentsToText do
  use Ecto.Migration

  def change do
    alter table(:comments) do
      modify :text, :text, from: :string
    end
  end
end
