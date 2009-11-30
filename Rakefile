task :stylesheet do
  options = []
  options << "--watch" if ENV['WATCH']
  sh "lessc #{options.join(' ')} tryphon.less stylesheets/tryphon.css"
end 

task :default => :stylesheet
