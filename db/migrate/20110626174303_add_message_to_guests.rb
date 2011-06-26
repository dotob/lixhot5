class AddMessageToGuests < ActiveRecord::Migration
  def self.up
    add_column :guests, :message, :string
  end

  def self.down
    remove_column :guests, :message
  end
end
