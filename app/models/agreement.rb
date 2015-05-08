class Agreement < ActiveRecord::Base

  has_attached_file :logo, :url => "/:class/:attachment/:id/logo.png", :default_url => "missing.png"
  validates_attachment_content_type :logo, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  has_many :users

end
