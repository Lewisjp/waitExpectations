class CreateEventInstances < ActiveRecord::Migration
  def change
    create_table :event_instances do |t|
      t.integer :User_id
      t.integer :Event_id
      t.integer :hour
      t.integer :minute
      t.boolean :am
      t.string :date
      t.string :day
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
