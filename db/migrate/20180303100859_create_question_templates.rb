class CreateQuestionTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :question_templates do |t|
      t.string :question_type
      t.string :question_text
      t.boolean :multiple

      t.timestamps
    end
  end
end
