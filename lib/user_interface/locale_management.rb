module UserInterface::LocaleManagement

  def self.included(base)
    base.class_eval do
      before_filter :change_locale
    end
  end

  private

  def change_locale
    user_session.language = params[:lang] if params[:lang]
    I18n.locale = user_session.language
  end

end
