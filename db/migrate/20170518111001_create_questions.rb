class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.references :author, null: false
      t.references :best_answer

      t.timestamps(null: false)
    end
  end
end
