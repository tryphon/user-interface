# TODO Find a better place to include will_paginate ?
require 'will_paginate'

module UserInterface
  class Engine < Rails::Engine
    config.to_prepare do
      ApplicationController.send :include, UserInterface::UserSessionManagement
      ApplicationController.send :include, UserInterface::LocaleManagement
    end
  end
end
