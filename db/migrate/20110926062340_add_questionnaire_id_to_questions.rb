class AddQuestionnaireIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :questionnaire_id, :integer
  end
end
