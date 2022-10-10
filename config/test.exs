import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :domo_umbrella_reproduction_web, DomoUmbrellaReproductionWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "x7O0gTMI6egIwMARsQUWWnI4DafSUl7R0KvRVNMVXNmmTi/lp5VG7NI3AeDXq18P",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# In test we don't send emails.
config :domo_umbrella_reproduction, DomoUmbrellaReproduction.Mailer, adapter: Swoosh.Adapters.Test

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
