class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :likes
  has_many :comments
  has_many :sent_messages, class_name: "PrivateMessage", foreign_key: "sender_id"
  has_and_belongs_to_many :received_messages, class_name: "PrivateMessage"
end
