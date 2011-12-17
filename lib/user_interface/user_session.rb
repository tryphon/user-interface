class UserInterface::UserSession

  attr_reader :session

  def initialize(session, defaults = {})
    @session = session
    use_defaults(defaults)
  end

  def use_defaults(defaults)
    used_defaults = defaults.delete_if do |attribute, value|
      not send(attribute).nil?
    end

    unless used_defaults.empty?
      used_defaults.each { |k,v| send("#{k}=", v) }
    end
  end

  @@supported_languages = %w{en fr}
  cattr_reader :supported_languages

  def supported_language(language)
    supported_languages.include?(language) ? language : I18n.default_locale.to_s
  end

  def language
    @language = session[:language]
  end

  def language=(language)
    session[:language] = supported_language(language.to_s)
  end

end
