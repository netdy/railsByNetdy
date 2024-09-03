class UserInfo < ApplicationRecord
  validates :FirstName, presence: true
  validates :LastName, presence: true
  validates :DateOfBirth, presence: true
  validates :Gender, presence: true
  validates :Email, presence: true
  validates :PhoneNumber, presence: true
  validates :Subject, presence: true
end
