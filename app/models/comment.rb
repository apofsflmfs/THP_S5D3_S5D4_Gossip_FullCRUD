class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :commentable, polymorphic: true
  has_many :likes, as: :content, :dependent => :destroy
  has_many :comments, as: :commentable
end
