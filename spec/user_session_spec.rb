require 'spec_helper'

describe UserInterface::UserSession do

  let(:session) { mock("HttpSession") } 
  let(:user_session) { UserInterface::UserSession.new(session) } 

  describe "language" do
    
    it "should use language attribute stored in session" do
      session.should_receive(:[]).with(:language).and_return("dummy")
      user_session.language.should == "dummy"
    end

  end

end
