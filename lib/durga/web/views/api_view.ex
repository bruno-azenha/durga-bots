defmodule Durga.Web.ApiView do
  use Durga.Web, :view

  def render("get_bot.json", %{bot: bot}), do: bot
end
