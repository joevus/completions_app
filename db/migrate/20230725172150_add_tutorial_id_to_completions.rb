class AddTutorialIdToCompletions < ActiveRecord::Migration[7.0]
  def change
    add_column :completions, :tutorial_id, :integer
  end
end
