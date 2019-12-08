class ChangeTypeToGrade < ActiveRecord::Migration[6.0]

  def change
    rename_column :climbs, :type, :grade
  end

end
