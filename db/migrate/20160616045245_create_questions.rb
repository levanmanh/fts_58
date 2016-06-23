class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.integer :question_type
      t.integer :state, default: 0
      t.integer :subject_id
      t.integer :user_id

      t.references :user, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
