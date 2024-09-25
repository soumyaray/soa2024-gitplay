# Ruby web application using Roda framework to serve views from views/ directory

require 'roda'

class App < Roda
  plugin :render

  route do |r|
    r.root do
      view('home')
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
