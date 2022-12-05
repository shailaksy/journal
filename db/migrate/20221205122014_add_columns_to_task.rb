class AddColumnsToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :name, :string
    add_column :tasks, :details, :string
    add_column :tasks, :category_id, :integer
  end
end
