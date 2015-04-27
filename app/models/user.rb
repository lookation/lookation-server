class User < ActiveRecord::Base

  def distances_from(phone_numbers)
    phone_numbers = phone_numbers.split(",")
    Distance.between(self.phone_number, phone_numbers)
  end
end
