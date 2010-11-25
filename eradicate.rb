require 'sinatra'
require 'haml'
require 'compass'
require 'lorem'

configure do
  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = 'views/stylesheets'
  end

  set :haml, { :format => :html5 }
  #fuck me.. it was :scss instead of :sass
  set :scss, Compass.sass_engine_options
end

helpers do
  def nav
    {
      "Home" => [],
      "About us" => [],
      "Services" => [:ants, :cockroach, :flies, :honeybee, :mice,
                     :mosquito, :"non-toxic-treatment", :"other-pest-control",
                     :rats, :spiders, :squirrels, :termites ],
      "Bed Bugs" => [],
      "Bed Bug Dog" => [],
      "Cryonite" => [],
      "Prep Info" => [],
      "Recent Work" => [],
      "Contact us" => []
    }
  end
  def lorem(type, n)
    Lorem::Base.new(type, n).output
  end
end

get '/style.css' do
  scss :"stylesheets/style"
end

get '/' do
  haml :home
end

get '/:name' do |name|
  haml :"#{name}"
end


