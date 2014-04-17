class CreatePairs < ActiveRecord::Migration
  def change
    create_table :pairs do |t|
      t.belongs_to :subject, index: true
      t.date :today

      t.timestamps
    end
  end
end
