module UserInterface::LocaleManagement

  def self.included(base)
    base.class_eval do
      before_filter :change_locale
    end
  end

  private

  def change_locale
    I18n.locale = params[:lang] if params[:lang]
  end

end
