class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|
      t.string :kind
      t.string :size
      t.string :demeanor
      t.string :color

      t.timestamps
    end
  end
end
