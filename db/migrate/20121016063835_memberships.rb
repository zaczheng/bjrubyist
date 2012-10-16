class Memberships < ActiveRecord::Migration
  def up
  	  create_table :memberships do |t|
      t.integer :event_id
      t.integer :member_id
      t.timestamps
    end

    # Add table index
    add_index :memberships, [:event_id, :member_id], :unique => true
  end

  def down
  	remove_index :memberships, :column => [:event_id, :member_id]
    drop_table :memberships
  end
end
