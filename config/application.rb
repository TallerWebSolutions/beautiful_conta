require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module LindaWeb
  class Application < Rails::Application
    config.load_defaults 5.2

    config.eager_load_paths << Rails.root.join('lib')
    config.time_zone = "America/Sao_Paulo"

    config.assets.paths << Rails.root.join("app", "assets", "fonts")

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :put, :delete]
      end
    end

  end
end
