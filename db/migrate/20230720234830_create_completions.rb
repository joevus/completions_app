class CreateCompletions < ActiveRecord::Migration[7.0]
  def change
    create_table :completions do |t|
      t.string :first_name
      t.string :last_name
      t.string :uid
      t.time :completion_time

      t.timestamps
    end
  end
end
