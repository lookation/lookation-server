ActiveAdmin.register User do
  permit_params :longitude, :latitude, :phone_number
end