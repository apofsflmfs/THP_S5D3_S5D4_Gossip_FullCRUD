class CreateGossips < ActiveRecord::Migration[5.2]
  def change
    create_table :gossips do |t|
      t.text :content
      t.belongs_to :user, index: true
      t.timestamp :date
      t.timestamps
    end
  end
end
