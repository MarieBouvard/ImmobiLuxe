class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :houses
  has_one_attached :image
  has_one_attached :cover_image
  paginates_per 15
       
  def full_name
    "#{email}"
  end
end
