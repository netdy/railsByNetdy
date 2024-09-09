class UserInfo < ApplicationRecord
  validates :FirstName, presence: true
  validates :LastName, presence: true
  validates :DateOfBirth, presence: { message: "Please fill in your birth date correctly." }
  validates :Gender, presence: true, inclusion: { in: [ "Male", "Female" ] }
  validates :Email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :PhoneNumber, presence: true, format: { with: /\A\d{10}\z/ }
  validates :Subject, presence: true
end
