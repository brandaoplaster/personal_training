defmodule PersonalTrainingWeb.PageController do
  use PersonalTrainingWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
