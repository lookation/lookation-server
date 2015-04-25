class PhoneNumber
  def initialize(phone_number)
    @phone_number = phone_number
  end

  def phone_number
    @phone_number.split(//).last(10).join
  end
end