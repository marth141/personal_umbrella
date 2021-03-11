# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :personal,
  ecto_repos: [Personal.Repo]

config :personal_web,
  ecto_repos: [Personal.Repo],
  generators: [context_app: :personal]

# Configures the endpoint
config :personal_web, PersonalWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DotdjG1BItE/AKfsLsRlq3zpHreMBp30qrvkRNmshrW/bH8yv4GRzAPZNozD4NvX",
  render_errors: [view: PersonalWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Personal.PubSub,
  live_view: [signing_salt: "A8daEw3b"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenix, :template_engines, md: PhoenixMarkdown.Engine

config :ex_twilio,
  account_sid: System.get_env("TWILIO_ACCOUNT_SID"),
  auth_token: System.get_env("TWILIO_AUTH_TOKEN")
  # optional
  # workspace_sid: {:system, "TWILIO_WORKSPACE_SID"}

config :personal_web, PersonalWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex|md)$}
    ]
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
