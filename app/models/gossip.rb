class Gossip < ApplicationRecord
  has_and_belongs_to_many :tags
  belongs_to :user
  has_many :likes, as: :content, :dependent => :destroy
  has_many :comments, as: :commentable, :dependent => :destroy
end
