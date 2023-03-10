defmodule Todo.Repo.Migrations.CreateTodoUser do
  use Ecto.Migration

  def change do
    alter table(:todo_items) do
      add :user_id, references("users")
    end
  end
end
