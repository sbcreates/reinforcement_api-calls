require 'httparty'

class RepresentativesController < ApplicationController

  def index
    response = HTTParty.get('https://represent.opennorth.ca/representatives/')
    parsed_response = JSON.parse(response.body)

    useful_data = parsed_response['objects']

    render json:
      useful_data.map { |data| {first_name: data["first_name"], last_name: data["last_name"], district: data["district_name"], elected_office: data["elected_office"], email: data["email"]}
      }

  end
end
