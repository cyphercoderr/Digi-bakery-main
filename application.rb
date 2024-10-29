require_relative 'boot'

require 'rails/all'

require 'pusher'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CodingChallenge
  class Application < Rails::Application
    config.active_job.queue_adapter = :sidekiq
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    Pusher.app_id = ENV['PUSHER_APP_ID']  #Replace creds with envs
    Pusher.key = ENV['PUSHER_API_KEY']
    Pusher.secret = ENV['PUSHER_SECRET_KEY']
    Pusher.cluster = ENV['PUSHER_CLUSTER']
    config.generators do |g|
      g.test_framework :rspec,
                       fixtures: true,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: false,
                       request_specs: false
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
    end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Don't generate system test files.
    config.generators.system_tests = nil

    config.proscenium.include_paths << 'app/components'
  end
end
