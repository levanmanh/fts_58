class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :answer_id
      t.integer :question_id
      t.integer :lesson_id
      t.string :answer, default: ""

      t.references :lesson, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
