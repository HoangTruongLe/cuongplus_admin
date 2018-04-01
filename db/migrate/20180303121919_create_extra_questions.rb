class CreateExtraQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :extra_questions do |t|
      t.string :question_type
      t.jsonb :metadata
      t.boolean :done
      t.belongs_to :income, foreign_key: true
      t.belongs_to :question_template, foreign_key: true

      t.timestamps
    end
  end
end
