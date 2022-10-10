defmodule DomoUmbrellaReproductionWeb.PageController do
  use DomoUmbrellaReproductionWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
