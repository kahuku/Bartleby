class CreateSpells < ActiveRecord::Migration[7.0]
  def change
    create_table :spells do |t|
      t.string :name
      t.string :pips
      t.string :school
      t.integer :accuracy
      t.integer :damage

      t.timestamps
    end
  end
end
