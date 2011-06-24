class ChangeGiftDefault < ActiveRecord::Migration
  def self.up
		change_column_default(:guests, :gift_id, nil)
  end

  def self.down
  end
end
