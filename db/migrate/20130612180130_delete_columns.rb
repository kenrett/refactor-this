class DeleteColumns < ActiveRecord::Migration
  def change
    remove_column :todos, :status, :todo_count
  end
end
