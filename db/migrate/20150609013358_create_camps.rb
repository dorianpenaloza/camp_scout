class CreateCamps < ActiveRecord::Migration
  def change
    create_table :camps do |t|
      t.string :name
      t.string :weeks
      t.string :cost
      t.string :telephone
      t.string :website
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
