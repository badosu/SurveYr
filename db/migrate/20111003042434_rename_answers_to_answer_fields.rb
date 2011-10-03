class RenameAnswersToAnswerFields < ActiveRecord::Migration
  def change
      rename_table :answers, :answer_fields
  end 
end
