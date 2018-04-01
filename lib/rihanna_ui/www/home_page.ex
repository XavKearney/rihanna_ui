defmodule RihannaUi.WWW.HomePage do
  use Raxx.Server

  require EEx

  template = Path.join(__DIR__, "./home_page.html.eex")
  EEx.function_from_file(:defp, :view, template, [:assigns])

  @impl Raxx.Server
  def handle_request(_request, _state) do
    response(:ok)
    |> set_header("content-type", "text/html")
    |> set_body(view(%{}))
  end
end
