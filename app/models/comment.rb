class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :gossip
  has_many :likes, as: :content, :dependent => :destroy
end
