# Ruby web application using Roda framework to serve views from views/ directory

require 'roda'
require_relative 'models/api'

class App < Roda
  plugin :render

  route do |r|
    r.root do
      # get project models
      projs = Project.all
      view('home', locals: { projs: projs })
    end

    r.get 'projects' do
      projs = Project.all
      view('home', locals: { projs: projs })
    end

    # post request from home.html
    r.post 'home' do
      country = r.params['country']
      country_info = Api.new.get_country_info(country)
      if country_info.nil?
        view('not_found')
      else
        view('country_info', locals: { country_info: country_info })
      end
    end
  end
end
