class CreateFeatureOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :feature_options do |t|
      t.string :eyes
      t.string :mouth
      t.string :nose
      t.string :ears

      t.timestamps
    end
  end
end