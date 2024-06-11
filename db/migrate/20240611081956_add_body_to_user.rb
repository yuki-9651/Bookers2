class AddBodyToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :body, :string
  end
end
