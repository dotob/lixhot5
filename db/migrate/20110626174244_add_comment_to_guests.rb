class AddCommentToGuests < ActiveRecord::Migration
  def self.up
    add_column :guests, :comment, :string
  end

  def self.down
    remove_column :guests, :comment
  end
end
