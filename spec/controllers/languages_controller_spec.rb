require 'spec_helper'

describe LanguagesController do

  let(:back) { "http://back" }

  before(:each) do
    request.env["HTTP_REFERER"] = back
  end

  describe "change_language" do

    let(:user_session) { mock :language= => true, :language => "dummy" }

    before(:each) do
      controller.stub :user_session => user_session
    end

    it "should update user_session#language" do
      user_session.should_receive(:language=).with("dummy")
      get :show, :id => "dummy"
    end
    
    it "should redirect back" do
      get :show, :id => "dummy"
      response.should redirect_to(back)
    end

  end

end
