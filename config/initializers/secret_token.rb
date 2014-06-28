# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
RedisAuthApi::Application.config.secret_key_base = 'd6489e71e6dbc22bfbac44706ebb0a7ff9b04fb6094a97c03b08a3b335be629ae926837419a4c08c4e00a086a934d8004be842e96bba6496ce55be3d1d174fe3'
