class AddNameProfileToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_name, :string
    add_column :users, :pr, :string
  end
end
