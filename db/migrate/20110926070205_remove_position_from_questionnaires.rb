class RemovePositionFromQuestionnaires < ActiveRecord::Migration
  def up
    remove_column :questionnaires, :position
  end

  def down
    add_column :questionnaires, :position, :integer
  end
end
