desc "Build tryphon.css from less definition"
task :stylesheet do
  options = []
  options << "--watch" if ENV['WATCH']
  sh "lessc #{options.join(' ')} tryphon.less stylesheets/tryphon.css"
end 

require 'tempfile'
class RakeTask

  attr_accessor :color
  attr_accessor :logo

  def initialize(name, options = {})
    options = { 
      :color => "#a559e4", 
      :logo => 'bonnes-ondes'
    }.update(options)

    options.each { |k,v| send("#{k}=", v) }
    yield self if block_given?

    task(name) do
      Tempfile.open("tryphon-css") do |f|
        f.puts "@color: #{color};"
        f.puts "@logo_url: #{logo_url};"
        f.puts IO.read("tryphon.less")
        f.close

        sh "lessc #{f.path} stylesheets/tryphon.css"
      end
    end
  end

  def logo_url
    "url(\"../images/#{logo}.png\")"
  end

end

RakeTask.new :test #, :color => '#1273b4'

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
