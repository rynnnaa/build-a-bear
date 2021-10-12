class CreateStuffedAnimal < ActiveRecord::Migration[6.1]
  def change
    create_table :stuffed_animal do |t|
      t.integer "user_id"
      t.integer "animal_id"

      t.timestamps
    end
  end
end

