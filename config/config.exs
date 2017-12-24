# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :rocketcoin,
  ecto_repos: [Rocketcoin.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :rocketcoin, RocketcoinWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5MynhLq65bd1JScKqXoTQNlcthczHE1nN2oXk4xspzVln4fJFqpEZL/+IDZPMA9q",
  render_errors: [view: RocketcoinWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Rocketcoin.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
