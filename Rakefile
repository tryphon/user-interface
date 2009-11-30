desc "Build tryphon.css from less definition"
task :stylesheet do
  options = []
  options << "--watch" if ENV['WATCH']
  sh "lessc #{options.join(' ')} tryphon.less stylesheets/tryphon.css"
end 

require 'rubygems'

begin
  require 'deadweight'

  Deadweight::RakeTask.new do |dw|
    dw.stylesheets = %w( stylesheets/tryphon.css )
    dw.pages = %w( index.html )
    dw.root = ""
    dw.log_file = "/dev/null"
  end
rescue LoadError
  puts "Warning: deadweight gem is missing"
end

namespace :gems do
  desc "Install required gems"
  task :install do 
    sh "gem install less deadweight -s http://gemcutter.org"
  end
end

task :default => :stylesheet
