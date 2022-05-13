class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :contact, presence: true
  
  has_many :buses
  belongs_to :role
  has_many :booking_details
  has_many :cities
  
  has_many :passanger_details
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
accepts_nested_attributes_for :buses, allow_destroy: true
accepts_nested_attributes_for :passanger_details, allow_destroy: true

attr_accessor :login

def login
  @login || self.email
end
after_create :send_greetings_notification
  def send_greetings_notification  
  WelcomeMailer.send_greetings_notification(self)
                 .deliver_now
 end


 private


  def self.find_for_database_authentication(warden_condition)
    conditions = warden_condition.dup
    if(login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { value: login.downcase }]).first
    elsif  conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
