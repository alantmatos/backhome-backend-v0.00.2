class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species
      t.string :breed
      t.string :color
      t.string :size
      t.string :favorite_food
      t.string :medical_condition
      t.string :description

      t.timestamps
    end
  end
end
