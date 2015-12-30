class Article < ActiveRecord::Base

  belongs_to :topic
  belongs_to :user
  has_one :article_detail
  has_many :article_comments
  has_many :article_likes
  accepts_nested_attributes_for :article_detail
end
