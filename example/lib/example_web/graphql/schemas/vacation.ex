defmodule ExampleWeb.Schemas.Vacation do
  use Absinthe.Schema.Notation

  object :vacation_queries do
    field :places, list_of(:place) do
      resolve(&ExampleWeb.Resolvers.Vacation.places/3)
    end

    field :place, :place do
      arg(:id, non_null(:id))
      resolve(&ExampleWeb.Resolvers.Vacation.place/3)
    end
  end

  object :place do
    field(:id, non_null(:id))
    field(:name, non_null(:string))
    field(:location, non_null(:string))
    field(:max_guests, non_null(:integer))
  end
end
