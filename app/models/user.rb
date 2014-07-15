class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

	before_save :ensure_authentication_token

  has_attached_file :avatar, :styles => { :medium => "200x200#", :thumb => "40x40#" }, :url => "/:class/:attachment/:id/:style.png", :default_url => "/:class/:attachment/default.png"
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  #do_not_validate_attachment_file_type :avatar


	has_many :my_rides, :foreign_key => :user_id, :class_name => 'Ride' 
	has_and_belongs_to_many :rides
  has_and_belongs_to_many :vehicles

	def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  private
  
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end

end
