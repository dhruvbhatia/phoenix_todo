defmodule Todo.Items.TodoItem do
  alias Todo.Accounts.User
  use Ecto.Schema
  import Ecto.Changeset

  schema "todo_items" do
    field :text, :string

    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(todo_item, attrs) do
    todo_item
    |> cast(attrs, [:text, :user_id])
    |> validate_required([:text])
  end
end
