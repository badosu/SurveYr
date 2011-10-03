class CreateNewAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :answer_field_id
      t.integer :answer_form_id

      t.timestamps
    end
  end
end
