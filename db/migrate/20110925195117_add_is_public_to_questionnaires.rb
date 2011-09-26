class AddIsPublicToQuestionnaires < ActiveRecord::Migration
  def change
    add_column :questionnaires, :is_public, :boolean, :default => false
  end
end
