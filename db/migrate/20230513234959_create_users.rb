class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.string :image
      t.string :location
      t.string :email

      t.timestamps
    end
  end
end
