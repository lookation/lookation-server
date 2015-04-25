class UsersController < ApplicationController
  def create
    User.where(PhoneNumber.new(permit_params[:phone_number]).phone_number).first_or_create do |user|
      user.latitude = permit_params[:latitude]
      user.longitude = permit_params[:longitude]
    end
  end

  def update
    phone_number = PhoneNumber.new(permit_params[:phone_number]).phone_number
    User.where(phone_number)
        .first
        .update_attributes(longitude: permit_params[:longitude], latitude: permit_params[:latitude])
  end

  private

  def permit_params
    params.permit(:phone_number, :latitude, :longitude)
  end
end
