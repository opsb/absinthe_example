defmodule Blog.Router do
  use Phoenix.Router

  pipeline :graphql do
    plug Blog.Context
  end

  scope "/" do
    pipe_through :graphql

    # get "/graphiql", Absinthe.Plug.GraphiQL, schema: Blog.Schema
    # post "/graphiql", Absinthe.Plug.GraphiQL, schema: Blog.Schema
    forward "/api", Absinthe.Plug, schema: Blog.Schema
    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: Blog.Schema,
      socket: Blog.UserSocket,
      interface: :simple
  end
end
