class AddNullFalseToFields < ActiveRecord::Migration[5.0]
  def up
    change_column :questions, :title, :string, null: false
    change_column :questions, :description, :string, null: false
  end

  def down
    change_column :questions, :title, :string
    change_column :questions, :description, :string
  end
end
