# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
import Config

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

# You can configure your application as:
#
#     config :epmdless_elixir_example, key: :value
#
# and access this configuration in your application as:
#
#     Application.get_env(:epmdless_elixir_example, :key)
#
# You can also configure a 3rd-party app:
#
#     config :logger, level: :info
#

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env()}.exs"

# ----
# epmdless config with mTLS connection

# https://groups.google.com/g/phoenix-talk/c/teaQI8fzHuQ/m/rsbQ9iV5EwAJ
base_dir = Path.join(Path.dirname(__DIR__), "priv")

config :epmdless,
  transport: :tls,
  listen_port: 17_012,
  ssl_dist_opt: [
    server: [
      cacertfile: "#{base_dir}/ca.crt",
      certfile: "#{base_dir}/server.crt",
      keyfile: "#{base_dir}/server.key",
      fail_if_no_peer_cert: true,
      verify: :verify_peer
    ],
    client: [
      cacertfile: "#{base_dir}/ca.crt",
      certfile: "#{base_dir}/client.crt",
      keyfile: "#{base_dir}/client.key",
      verify: :verify_peer
    ]
  ]
