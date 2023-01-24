class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :appointments
         
  enum role: [:admin, :doctor, :lab_tech, :nurse, :front_desk]
  
  def name
    "#{first_name} #{last_name}"
  end
  
  def initials
    "#{first_name.first}#{last_name.first}".upcase 
  end
  
  def self.doctors
    self.where(role: 1)
  end
  
end
