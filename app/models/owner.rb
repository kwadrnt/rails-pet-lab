class Owner < ActiveRecord::Base
  # TODO: add association ot pets
  has_many :pets, dependent: :destroy
  has_secure_password

  # TODO: add association to appointments (through pets)

  # TODO: add validations
  validates :first_name, presence: true, uniqueness: true, length: {maximum: 255}
  validates :last_name, presence: true, uniqueness: true, length: {maximum: 255}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true, length: {maximum: 255}
  validates :phone, presence: true, uniqueness: true, length: {maximum: 255}

  before_save :normalize_phone_number

  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
    # stretch
    if phone.present?
      phone.gsub!(/^1/, "")
      phone.gsub!(/[()-.]/,"")
    end
  end

end
