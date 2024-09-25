# frozen_string_literal: true

class ApiExplore
  def initialize
    @api = Api.new
  end

  def explore
    puts 'Enter the name of the country you want to explore:'
    country = gets.chomp
    country_info = @api.get_country_info(country)
    if country_info.nil?
      puts 'Country not found'
    else
      puts 'Country Information'
      puts "Name: #{country_info['name']}"
      puts "Capital: #{country_info['capital']}"
      puts "Population: #{country_info['population']}"
      puts "Region: #{country_info['region']}"
      puts "Subregion: #{country_info['subregion']}"
      puts "Timezones: #{country_info['timezones']}"
      puts "Languages: #{country_info['languages'].map { |lang| lang['name'] }.join(', ')}"
      puts "Currencies: #{country_info['currencies'].map { |currency| currency['name'] }.join(', ')}"
    end
  end
end
