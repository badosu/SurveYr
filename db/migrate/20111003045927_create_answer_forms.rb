class CreateAnswerForms < ActiveRecord::Migration
  def change
    create_table :answer_forms do |t|
      t.integer :questionnaire_id
      t.integer :user_id
    end
  end
end
