class Distance
  def self.between(phone_number, phone_numbers)
    user = User.where(phone_number: phone_number).first
    phone_numbers.map do |friend_phone_number|
      friend = User.where(phone_number: PhoneNumber.new(friend_phone_number.to_s).phone_number).first
      distance = Geocoder::Calculations.distance_between([user.latitude, user.longitude], [friend.latitude, friend.longitude])
      {friend_phone_number.to_s => distance} unless friend.nil?
    end
  end
end