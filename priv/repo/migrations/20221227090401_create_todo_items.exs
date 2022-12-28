defmodule Todo.Repo.Migrations.CreateTodoItems do
  use Ecto.Migration

  def change do
    alter table(:todo_items) do
      add :text, :string

      timestamps()
    end
  end
end
