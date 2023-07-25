class ChangeCompletionTimeDataTypeInCompletions < ActiveRecord::Migration[7.0]
  def change
    remove_column :completions, :completion_time
    add_column :completions, :completion_time, :datetime
  end
end
