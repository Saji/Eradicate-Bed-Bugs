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
      "About Us" => [],
      "All Services" => [ "ants", "cockroach", "flies", "honeybee", "mice",
                         "mosquito", "non-toxic-treatment", "rodents",
                         "rats", "spiders", "squirrels", "termites" ],
      "Bed Bugs" => ["bed-bugs-pictures", "bed-bugs-rash", "bed-bugs-treatment",
                     "bed-mites", "chiggers", "fleas", "getting-rid-of-bed-bugs", "kill-bed-bugs"],
      "Bed Bug Dog" => ["bugs-dog", 
                         "bed-bug-cat", "chigger-dog", "flea-dog", "lice-dog",
                        "mites-dog", "scabies-dog", "tick-dog"],
      "Cryonite" => [],
      "Heat Treatment" => [],
      "Recent Work" => [],
      "Prep Info" => [],
      "Contact Us" => [],
      "Blog" => []
    }
  end
  def lorem(type, n)
    Lorem::Base.new(type, n).output
  end
  def downcase_spacedash(str)
    str.split.map { |x| x.downcase }.join('-')
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

get '/*/:name' do |main, sub|
  haml :"#{sub}"
end

