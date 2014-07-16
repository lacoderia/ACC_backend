class AddAttachmentLogoToAgreements < ActiveRecord::Migration
  def change
  	remove_column :agreements, :logo
  	add_attachment :agreements, :logo
  end
end
