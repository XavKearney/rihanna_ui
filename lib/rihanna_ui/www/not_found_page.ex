defmodule RihannaUI.WWW.NotFoundPage do
  use Raxx.Server

  require EEx

  template = Path.join(__DIR__, "./not_found_page.html.eex")
  EEx.function_from_file(:defp, :view, template, [:assigns])

  @impl Raxx.Server
  def handle_request(_request, _state) do
    response(:not_found)
    |> set_header("content-type", "text/html")
    |> set_body(view(%{}))
  end
end
