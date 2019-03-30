class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.datetime :finished_at
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.references :todo_list, foreign_key: true

      t.timestamps
    end
  end
end
