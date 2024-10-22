class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks, id: :uuid do |t|
      t.string :title
      t.text :description
      t.string :status
      t.string :priority
      t.date :due_date
      t.references :user, type: :uuid, foreign_key: true
      t.references :category, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
