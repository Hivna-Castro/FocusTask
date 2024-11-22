class AddUserIdToCategories < ActiveRecord::Migration[7.1]
  def change
    add_reference :categories, :user, type: :uuid, foreign_key: true, null: false
  end
end
