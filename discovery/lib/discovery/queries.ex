defmodule Discovery.CommonQueries do
  @moduledoc """
  Common query result operations.
  """
  alias Discovery.Repo

  @type pagination_t :: %{
          total: non_neg_integer,
          page: non_neg_integer,
          page_size: non_neg_integer,
          pages: non_neg_integer
        }
  @type paginated_result_t(list_item_t) :: {:ok, %{list: [list_item_t], pagination: pagination_t}}
  @type result_list_t(list_item_t) :: {:ok, [list_item_t]} | paginated_result_t(list_item_t)
  @type result_one_t(record_t) :: {:ok, record_t} | {:error, :not_found}
  @doc """
  Return all matching records from the DB for the given query. If pagination is provided as a second
  arg then we delegate to Scrivener to provide pagination info along with the result entries.
  """
  @spec result_list(Ecto.Query.t()) :: result_list_t(map)
  def result_list(query) do
    query |> Repo.all() |> result
  end

  @spec result_list(Ecto.Query.t(), map | nil) :: result_list_t(map)
  def result_list(query, nil) do
    result_list(query)
  end

  def result_list(query, pagination) do
    pagination = Map.merge(%{page_size: -1, page: -1}, pagination)

    query
    |> Repo.paginate(pagination)
    |> result
  end

  @doc """
  Fetch a single record from the database for the given query.
  """
  @spec result_one(Ecto.Query.t()) :: result_one_t(map)
  def result_one(query) do
    case query |> Repo.one() do
      nil -> {:error, :not_found}
      result -> {:ok, result}
    end
  end

  @doc """
  Wrap list or single record results into an :ok or :error tuple.
  """
  @spec result(map | nil) :: paginated_result_t(map)
  def result(nil) do
    {:error, :not_found}
  end

  def result(%{entries: _} = result) do
    {:ok,
     %{
       list: result.entries,
       pagination: %{
         total: result.total_entries,
         page: result.page_number,
         page_size: result.page_size,
         pages: result.total_pages
       }
     }}
  end

  def result(result) do
    {:ok, result}
  end
end
