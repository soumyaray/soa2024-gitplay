# Ruby web application using Roda framework to serve views from views/ directory

require 'roda'

class App < Roda
  plugin :render

  route do |r|
    r.root do
      view('home')
    end
  end
end
