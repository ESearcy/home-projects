defmodule ExampleWeb.Schema.MasterSchema do
  use Absinthe.Schema
  alias ExampleWeb.Schemas

  # import_types(Absinthe.Type.Custom)

  import_types(Schemas.Vacation)

  query do
    import_fields(:vacation_queries)
  end
end
