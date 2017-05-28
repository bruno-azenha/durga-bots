defmodule Durga.Web.Router do
  use Durga.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Durga.Web do
    pipe_through :browser # Use the default browser stack

    get "/", BotController, :index
    resources "/bots", BotController
    resources "/nodes", NodeController
    resources "/buttons", ButtonController

    get "/:id/chat", ChatController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", Durga.Web do
  #   pipe_through :api
  # end
end
