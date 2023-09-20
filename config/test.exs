import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :rddit_clone, RdditClone.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "rddit_clone_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rddit_clone, RdditCloneWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "zr+A/3JnBJi0z5hexuYD55RvfGMqyr2lUG9i41z9W99yi0ET4nWgVMczSfNcRqe4",
  server: false

# In test we don't send emails.
config :rddit_clone, RdditClone.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
