class DistancesController < ApplicationController

  protect_from_forgery with: :null_session

  def distance
    user = User.where(phone_number: PhoneNumber.new(user_params[:phone_number]).phone_number).first
    render json: user.distances_from(user_params[:phone_numbers])
  end

  def user_params
    params.require(:users).permit(:phone_number,:phone_numbers)
  end
end
