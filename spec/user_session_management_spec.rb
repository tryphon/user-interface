require 'spec_helper'

describe UserInterface::UserSessionManagement do

  class TestUserSessionManagement
    @@helper_methods = []
    cattr_reader :helper_methods

    def self.helper_method(name)
      helper_methods << name
    end

    def initialize(session, request)
      @session = session
      @request = request
    end
    attr_reader :session, :request

    include UserInterface::UserSessionManagement
  end

  let(:session) { mock "HttpSession", :[]= => nil }
  let(:request) { mock "HttpRequest", :env => {} }
  let(:controller) { TestUserSessionManagement.new(session, request) }

  it "should define user_session as an helper_method" do
    controller.helper_methods.should include(:user_session)
  end

  describe "#user_session" do

    let(:user_interface) { stub(UserInterface::UserSession) }
    
    it "should create a new UserSession with controller session" do
      UserInterface::UserSession.should_receive(:new).and_return(user_interface)
      controller.send(:user_session).should == user_interface
    end

    it "should create a new UserSession with default language" do
      controller.stub :default_language => "dummy"
      UserInterface::UserSession.should_receive(:new).with(session, hash_including(:language => "dummy")).and_return(user_interface)
      controller.send(:user_session)
    end

    it "should not create two UserSessions" do
      user_interface = controller.send(:user_session)
      UserInterface::UserSession.should_not_receive(:new)
      controller.send(:user_session).should == user_interface
    end

  end

  describe "#default_language" do
    
    it "should be accepted_language when available" do
      controller.stub :accepted_language => "dummy"
      controller.send(:default_language).should == "dummy"
    end

    it "should be :fr without accepted_language" do
      controller.stub! :accepted_language
      controller.send(:default_language).should == :fr
    end

  end

end
