defmodule Node.Common do
  def paginate_response(list, pagination) do
    case pagination do
      %{page: page, page_size: pageSize} ->
        paginate_list(list, page, pageSize)

      %{} ->
        paginate_list(list, 1, 5)
    end
  end

  def paginate_list(list, page, pageSize) do
    remaining_list = remove_leading_pages(list, page, pageSize)
    selected_list = Enum.take(remaining_list, pageSize)

    %{
      list: selected_list,
      pagination: %{
        page: page,
        page_size: pageSize,
        total: length(list),
        pages: length(list) / pageSize
      }
    }
  end

  def remove_leading_pages(list, page, pageSize) do
    case page > 1 do
      true -> remove_leading_pages(Enum.drop(list, pageSize), page - 1, pageSize)
      false -> list
    end
  end

  # fully inclusive OR filter
  def filter_inclusive_or(list, filter) do
    list =
      for {k, v} <- filter do
        # "filtering on k: #{k} v: #{v}" |> IO.inspect()
        list2 =
          for value <- v do
            list = filter_list_on_key(list, k, value)
            list
          end

        list2
      end

    List.flatten(list)
    |> Enum.dedup()
  end

  def filter_list_on_key(list, key, value) do
    Enum.filter(
      list,
      &(value == &1[key])
    )
  end
end
