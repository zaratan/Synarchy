require "cinch/plugins/identify"
require_relative "token.rb"

Lita.configure do |config|
  # The name your robot will use.

      config.adapters.irc.server = "irc.iiens.net"
      config.adapters.irc.channels = ["#zaratan"]
      config.adapters.slack.token = SLACK_TOKEN 
      config.adapters.irc.user = "Synarchy"
      config.adapters.irc.realname = "Clara"
      config.adapters.irc.log_level = :log
      config.adapters.irc.cinch = lambda do |cinch_config|
        cinch_config.plugins.plugins = [Cinch::Plugins::Identify]
        cinch_config.plugins.options[Cinch::Plugins::Identify] = {
          :password => CINCH_PASSWORD,
          :type     => :nickserv,
        }
      end

  case ENV["to"]
    when "IIENS"
      Lita.const_set('REDIS_NAMESPACE', "lita_iiens")
      config.http.port = 11111
      config.robot.admins = IIENS_ROBOT_ADMIN
      config.robot.adapter = :irc
      config.adapters.irc.server = "irc.iiens.net"
      config.adapters.irc.channels = ["#zaratan", "#skelz0r"]
    when "RIZON"
      Lita.const_set('REDIS_NAMESPACE', "lita_rizon")
      config.http.port = 11112
      config.robot.adapter = :irc
      config.robot.admins = RIZON_ROBOT_ADMIN
      config.adapters.irc.server = "irc.rizon.net"
      config.adapters.irc.channels = ["#zaratan", "#computer", "#linael", "#storytime"]
    when "SLACK"
      Lita.const_set('REDIS_NAMESPACE', "lita_slack")
      config.http.port = 11113
      config.robot.adapter = :slack
  end


  # The locale code for the language to use.
  # config.robot.locale = :en

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = :info

  # An array of user IDs that are considered administrators. These users
  # the ability to add and remove other users from authorization groups.
  # What is considered a user ID will change depending on which adapter you use.
  # config.robot.admins = ["1", "2"]

  # The adapter you want to connect with. Make sure you've added the
  # appropriate gem to the Gemfile.

  ## Example: Set options for the chosen adapter.
  # config.adapter.username = "myname"
  # config.adapter.password = "secret"

  ## Example: Set options for the Redis connection.
  # config.redis.host = "127.0.0.1"
  # config.redis.port = 1234

  ## Example: Set configuration for any loaded handlers. See the handler's
  ## documentation for options.
  # config.handlers.some_handler.some_config_key = "value"
  config.robot.locale = "fr"
  config.robot.name = "Synarchy"
  config.robot.alias = "!"
end
