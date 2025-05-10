class CreateToDos < ActiveRecord::Migration[7.2]
  def change
    create_table :to_dos do |t|
      t.string :title
      t.string :category_id
      t.boolean :completed
      t.boolean :priority
      t.string :user_id

      t.timestamps
    end
  end
end
