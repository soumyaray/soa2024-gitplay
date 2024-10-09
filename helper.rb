# frozen_string_literal: true

# helper methods for Roda controllers
module Helper
  def view(name, locals = {})
    render("views/#{name}.html.erb", locals)
  end
end

# helper methods for ActiveRecord models
module Helper
  def get_country_info(country)
    response = HTTP.get("https://restcountries.com/v3.1/name/#{country}")
    return nil if response.code != 200

    JSON.parse(response.body)
  end
end
