class AddSolvedToRoadsideAssistances < ActiveRecord::Migration
  def change
  	add_column :roadside_assistances, :solved, :boolean, default: false
  end
end
