class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :spelling
      t.integer :length
    end
    add_index :words, :length
  end
end
