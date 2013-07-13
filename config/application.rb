require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env)

module GeneralAssembly
  class Application < Rails::Application

    config.compass.images_dir = '/app/assets/images'

  end
end
