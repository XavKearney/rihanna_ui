defmodule RihannaUI.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do

    config = %{}
    cleartext_options = [port: 8080, cleartext: true]
    secure_options = [port: 8443, cleartext: :false, certfile: certificate_path(), keyfile: certificate_key_path()]

    children = [
      Supervisor.child_spec({RihannaUI.WWW, [config, cleartext_options]}, id: :www_cleartext),
      Supervisor.child_spec({RihannaUI.WWW, [config, secure_options]}, id: :www_secure),

    ]

    opts = [strategy: :one_for_one, name: RihannaUI.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp certificate_path() do
    Application.app_dir(:rihanna_ui, "priv/localhost/certificate.pem")
  end

  defp certificate_key_path() do
    Application.app_dir(:rihanna_ui, "priv/localhost/certificate_key.pem")
  end
end
