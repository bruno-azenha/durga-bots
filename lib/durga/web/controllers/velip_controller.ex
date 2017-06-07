defmodule Durga.Web.VelipController do
  use Durga.Web, :controller

  require Logger

  def callback(conn, params) do
      Logger.info("Velip Callback is: #{inspect(params)}")
      conn
      |> resp(:ok, "")
  end
end
