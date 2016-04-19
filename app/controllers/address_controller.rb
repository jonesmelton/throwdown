class AddressController < ApplicationController

  def convert
    uri = URI("https://maps.googleapis.com/maps/api/geocode/json?address=#{params[:address]}&key=#{ENV["GEO"]}")
    response = Net::HTTP.get(uri)
    response
    puts response
  end

end
