# UserInterface

module UserInterface
  
end

require 'user_interface/locale_management'
require 'user_interface/helpers/flash_helper'
require 'user_interface/helpers/title_helper'

if defined?(ActionView::Base)
  ActionView::Base.send :include, UserInterface::FlashHelper
  ActionView::Base.send :include, UserInterface::TitleHelper
end

