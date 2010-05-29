class UserInterface::UserSession

  def initialize(session, defaults = {})
    @session = session
    defaults.each { |k,v| send("#{k}=", v) }
  end

  def language
    @language = @session[:language]
  end

  def language=(language)
    @session[:language] = language.to_s
  end

end
