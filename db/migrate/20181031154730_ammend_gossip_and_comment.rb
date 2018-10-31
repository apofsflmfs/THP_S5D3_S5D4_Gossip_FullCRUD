class AmmendGossipAndComment < ActiveRecord::Migration[5.2]
  def change
    add_column :gossips, :anonymous_gossiper, :string
    add_column :comments, :anonymous_commentor, :string

  end
end
