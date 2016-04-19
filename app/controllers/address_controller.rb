class AddressController < ApplicationController

  def convert
    uri = URI("https://maps.googleapis.com/maps/api/geocode/json?address=#{params[:address]}&key=#{ENV["GEO"]}")
    render json: Net::HTTP.get(uri)
  end

end
