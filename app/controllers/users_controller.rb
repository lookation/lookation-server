class UsersController < ApplicationController

  protect_from_forgery with: :null_session

  def create
    User.where(phone_number: PhoneNumber.new(user_params[:phone_number]).phone_number).first_or_create do |user|
      user.phone_number = user_params[:phone_number]
      user.latitude = user_params[:latitude]
      user.longitude = user_params[:longitude]
    end
    render json: {message: "success"}
  end

  def update
    phone_number = PhoneNumber.new(user_params[:phone_number]).phone_number
    user = User.where(phone_number: phone_number)
               .first
               .update_attributes(longitude: user_params[:longitude], latitude: user_params[:latitude])
    if !user.nil?
      render json: {message: "success"}
    else
      render status: :not_found, json: {message: "user not found"}
    end
  end

  private

  def user_params
    params.require(:users).permit(:phone_number, :latitude, :longitude)
  end
end
