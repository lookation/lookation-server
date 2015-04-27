class Distance
  def self.between(phone_number, phone_numbers)
    user = User.where(phone_number: phone_number).first
    phone_numbers.map do |friend_phone_number|
      friend = User.where(phone_number: PhoneNumber.new(friend_phone_number.to_s).phone_number).first
      {friend_phone_number.to_s => Geocoder::Calculations.distance_between([user.latitude, user.longitude], [friend.latitude, friend.longitude])} unless friend.nil?
    end
  end
end