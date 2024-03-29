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

  scope "/admin", Durga.Web do
    pipe_through :browser # Use the default browser stack

    get "/", BotController, :index

    resources "/bots", BotController

    get "/nodes/new/bot/:bot_id", NodeController, :new
    resources "/nodes", NodeController, only: [:show, :create, :delete, :edit, :update]

    get "/buttons/new/node/:node_id", ButtonController, :new
    resources "/buttons", ButtonController, only: [:show, :create, :delete, :edit, :update]
  end

  scope "/", Durga.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/chat/:id", ChatController, :show
  end


  scope "/api", Durga.Web do
    pipe_through :api

    get "/node/:id", ApiController, :get_node
    get "/bot/:id", ApiController, :get_bot
  end
end
