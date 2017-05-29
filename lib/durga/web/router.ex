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

    get "/chat/:id", ChatController, :show
  end

 scope "/api", Durga.Web do
   pipe_through :api

   get "/node/:id", ApiController, :get_node
 end
end
