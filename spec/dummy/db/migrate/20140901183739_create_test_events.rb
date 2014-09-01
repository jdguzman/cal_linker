class CreateTestEvents < ActiveRecord::Migration
  def change
    create_table :test_events do |t|
      t.string :name
      t.datetime :starting_at
      t.datetime :ending_at

      t.timestamps
    end
  end
end
