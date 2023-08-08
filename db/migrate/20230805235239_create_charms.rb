class CreateCharms < ActiveRecord::Migration[7.0]
  def change
    create_table :charms do |t|
      t.string :name
      t.string :school
      t.integer :percentage
      t.integer :pips

      t.timestamps
    end
  end
end
