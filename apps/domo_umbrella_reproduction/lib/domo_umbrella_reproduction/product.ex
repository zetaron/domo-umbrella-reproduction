defmodule DomoUmbrellaReproduction.Product do
  use Domo, skip_defaults: true

  @type t :: %__MODULE__{
    name: String.t(),
    price: float(),
    description: String.t()
  }
  defstruct name: "",
            price: 0.0,
            description: ""
end
