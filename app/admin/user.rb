ActiveAdmin.register User do
  permit_params :longitude, :latitude, :phone_number

  def distances_from(phone_numbers)
    Distance.between(self.phone_number, phone_numbers)
  end
end