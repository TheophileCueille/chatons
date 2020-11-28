class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
         
         has_many :carts
         has_one_attached :avatar

   validates_presence_of :first_name, :last_name

   after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
 
end
