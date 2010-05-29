class LanguagesController < ApplicationController

  def show
    change_language
  end
  
  def update
    change_language
  end
  
  private

  def change_language
    user_session.language = params[:id]
    redirect_to :back
  end

end
