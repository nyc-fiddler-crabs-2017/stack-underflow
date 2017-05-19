class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.references :author, null: false
      t.integer :best_answer_id

      t.timestamps(null: false)
    end
  end
end
