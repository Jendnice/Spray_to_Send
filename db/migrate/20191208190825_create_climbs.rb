class CreateClimbs < ActiveRecord::Migration[6.0]
  def change
    create_table :climbs do |t|
      t.string :name
      t.string :type
      t.string :description
      t.belongs_to :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end


