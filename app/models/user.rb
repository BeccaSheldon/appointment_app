class User < ActiveRecord::Base
  has_many :appointments
  has_many :appointees, :through => :appointments

  validates_presence_of :name

  mount_uploader :image, ImageUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end


# user 
# appointment
# -2 columns: appointer appointee:integer