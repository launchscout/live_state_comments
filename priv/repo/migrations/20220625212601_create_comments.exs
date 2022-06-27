defmodule LiveStateComments.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :author, :string
      add :url, :string
      add :text, :string

      timestamps()
    end
  end
end
