class AddAuditoryNumberToPairs < ActiveRecord::Migration
  def change
    add_column :pairs, :auditory, :integer
    add_column :pairs, :number, :integer
  end
end
