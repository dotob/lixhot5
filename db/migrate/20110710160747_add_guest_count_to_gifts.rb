class AddGuestCountToGifts < ActiveRecord::Migration
  def self.up
    add_column :gifts, :guest_count, :int
  end

  def self.down
    remove_column :gifts, :guest_count
  end
end
