class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :status
      t.integer :point
      t.integer :subject_id
      t.integer :user_id

      t.references :user, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
