class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :content
      t.references :memo, foreign_key: true
      t.integer :position
      t.boolean :done, null: false, default: false

      t.timestamps
    end
  end
end
