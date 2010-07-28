class UserInterface::UserSession

  def initialize(session, defaults = {})
    @session = session
    use_defaults(defaults)
  end

  def use_defaults(defaults)
    used_defaults = defaults.delete_if do |attribute, value|
      not send(attribute).nil?
    end

    unless used_defaults.empty?
      Rails.logger.debug { "Use defaults for user session: #{used_defaults.inspect}" }
      used_defaults.each { |k,v| send("#{k}=", v) }
    end
  end

  def language
    @language = @session[:language]
  end

  def language=(language)
    @session[:language] = language.to_s
  end

end
