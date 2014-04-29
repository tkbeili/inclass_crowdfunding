class User < ActiveRecord::Base

  has_secure_password

  has_one :profile

  accepts_nested_attributes_for :profile

  validates :email, presence: true, uniqueness: true, email_format: true

  delegate :full_name, to: :profile


end