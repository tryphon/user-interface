# TODO Find a better place to include will_paginate ?
require 'will_paginate'

module UserInterface
  class Engine < Rails::Engine
    config.to_prepare do
      ApplicationController.send :include, UserInterface::UserSessionManagement
      ApplicationController.send :include, UserInterface::LocaleManagement

      # To use our devise views instead of original ones
      ApplicationController.prepend_view_path File.expand_path("../../../app/views", __FILE__)
      ActionMailer::Base.prepend_view_path File.expand_path("../../../app/views", __FILE__)
    end
  end
end
