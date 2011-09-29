class RemovePositionFromQuestion < ActiveRecord::Migration
  def up
    remove_column :questions, :position
  end

  def down
    add_column :questions, :position, :integer
  end
end
