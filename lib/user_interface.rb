# UserInterface

module UserInterface
  
end

require 'user_interface/locale_management'
require 'user_interface/helpers/flash_helper'
require 'user_interface/helpers/title_helper'
require 'user_interface/helpers/will_paginate_helper'

if defined?(ActionView::Base)
  ActionView::Base.send :include, UserInterface::FlashHelper
  ActionView::Base.send :include, UserInterface::TitleHelper
end

if defined?(WillPaginate::ViewHelpers)
  ActionView::Base.send :include, UserInterface::WillPaginateHelper
end

