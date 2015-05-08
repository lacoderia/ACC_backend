class Perk < ActiveRecord::Base
  has_many :locations

  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "60x60>" }, :default_url => "missing.png"
  validates_attachment_content_type :logo, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
