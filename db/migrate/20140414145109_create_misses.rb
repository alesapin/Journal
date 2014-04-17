class CreateMisses < ActiveRecord::Migration
  def change
    create_table :misses do |t|
      t.belongs_to :student, index: true
      t.belongs_to :pair
      t.integer :hours

      t.timestamps
    end
  end
end
