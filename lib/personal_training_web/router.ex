defmodule PersonalTrainingWeb.Router do
  use PersonalTrainingWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json", "xml"]
  end

  scope "/", PersonalTrainingWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/teacher/search", TeacherController, :search
    resources "/teacher", TeacherController
    get "/member/search", MemberController, :search
    resources "/member", MemberController
  end

  scope "/api", PersonalTrainingWeb.Api, as: :api do
    pipe_through :api

    resources "/teacher", TeacherController, except: [:new, :edit]
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: PersonalTrainingWeb.Telemetry
    end
  end
end
