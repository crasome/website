require 'dotenv'

Dotenv.load(
  File.expand_path("../environments/.#{Rails.env}.env", __dir__),
  File.expand_path("../.env",  __dir__)
)
