class Perk < ActiveRecord::Base
  has_many :locations

  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "60x60>" }, :url => "/:class/:attachment/:id/:style.png", :default_url => "/:class/:attachment/default.png"
  validates_attachment_content_type :logo, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
