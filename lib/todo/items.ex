defmodule Todo.Items do
  @moduledoc """
  The Items context.
  """

  import Ecto.Query, warn: false
  alias Todo.Repo

  alias Todo.Items.TodoItem
  alias Todo.Accounts.User

  @doc """
  Returns the list of todo_items and preloads the assosciated user.

  ## Examples

      iex> list_todo_items()
      [%TodoItem{}, ...]

  """
  def list_todo_items do
    Repo.all(TodoItem) |> Repo.preload(:user)
  end

  @doc """
  Gets a single todo_item.

  Raises `Ecto.NoResultsError` if the Todo item does not exist.

  ## Examples

      iex> get_todo_item!(123)
      %TodoItem{}

      iex> get_todo_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_todo_item!(id), do: Repo.get!(TodoItem, id) |> Repo.preload(:user)

  @doc """
  Creates a todo_item.

  ## Examples

      iex> create_todo_item(%{field: value})
      {:ok, %TodoItem{}}

      iex> create_todo_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_todo_item(attrs \\ %{}, user) do


    IO.puts("usahhh")
    IO.inspect(user)

    user
    |> Ecto.build_assoc(:todo_items)
    |> TodoItem.changeset(attrs)
    |> Repo.insert



    # need to figure out how to create this in db with assoc
    # user
    # |> Ecto.build_assoc(:todo_items)
    # |> TodoItem.changeset(attrs)
    # |> Repo.insert()

    # attrs = attrs |> Map.put(:user_id, user.id)

    # %TodoItem{}
    # |> TodoItem.changeset(attrs)
    # |> Repo.insert()
  end

  @doc """
  Updates a todo_item.

  ## Examples

      iex> update_todo_item(todo_item, %{field: new_value})
      {:ok, %TodoItem{}}

      iex> update_todo_item(todo_item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_todo_item(%TodoItem{} = todo_item, attrs, _user) do

    todo_item
    |> TodoItem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a todo_item.

  ## Examples

      iex> delete_todo_item(todo_item)
      {:ok, %TodoItem{}}

      iex> delete_todo_item(todo_item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_todo_item(%TodoItem{} = todo_item) do
    Repo.delete(todo_item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking todo_item changes.

  ## Examples

      iex> change_todo_item(todo_item)
      %Ecto.Changeset{data: %TodoItem{}}

  """
  def change_todo_item(%TodoItem{} = todo_item, attrs \\ %{}) do
    TodoItem.changeset(todo_item, attrs)
  end
end
