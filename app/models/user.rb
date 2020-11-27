class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

         has_one_attached :avatar
   validates_presence_of :first_name, :last_name

   after_create :welcome_send, :confirmation

  def welcome_send
    User_mailer.welcome_email(self).deliver_now
  end


  def confirmation
    User.confirmation_instructions(self).deliver_now
  end 

end
