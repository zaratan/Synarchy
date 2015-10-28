require_relative('prod_token.rb') if File.exist?('prod_token.rb')

SLACK_TOKEN = 'slack_token' unless defined? SLACK_TOKEN
CINCH_PASSWORD = 'password' unless defined? CINCH_PASSWORD
IIENS_ROBOT_ADMIN = [] unless defined? IIENS_ROBOT_ADMIN
RIZON_ROBOT_ADMIN = [] unless defined? RIZON_ROBOT_ADMIN
YOUTUBE_API_KEY = 'youtube' unless defined? YOUTUBE_API_KEY
