class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :phone_number
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
