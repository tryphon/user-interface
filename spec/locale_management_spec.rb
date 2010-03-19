require 'spec_helper'

describe UserInterface::LocaleManagement do

  after(:each) do
    I18n.locale = nil
  end
  
  class TestLocaleManagement
    @@before_filters = []
    cattr_reader :before_filters

    def self.before_filter(name)
      before_filters << name
    end

    include UserInterface::LocaleManagement
  end

  before(:each) do
    @locale_management = TestLocaleManagement.new
  end

  it "should add a before_filter :change_locale" do
    @locale_management.before_filters.should == [ :change_locale ]
  end

  it "should change I18n.locale with params :lang" do
    @locale_management.stub!(:params).and_return(:lang => "fr")
    @locale_management.send(:change_locale)
    I18n.locale.should == "fr"
  end

end
