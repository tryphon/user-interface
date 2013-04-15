# TODO Find a better place to include will_paginate ?
require 'will_paginate'

module UserInterface
  class Engine < Rails::Engine
    config.to_prepare do
      ApplicationController.send :include, UserInterface::UserSessionManagement
      ApplicationController.send :include, UserInterface::LocaleManagement

      # To use our devise views instead of original ones

      view_path = File.expand_path("../../../app/views", __FILE__)
      
      devise_position = ApplicationController.view_paths.map(&:to_s).index { |p| p.match /devise/ }
      if devise_position
        ApplicationController.view_paths.insert devise_position, view_path
      else
        ApplicationController.prepend_view_path view_path
      end

      ActionMailer::Base.prepend_view_path view_path
    end
  end
end
