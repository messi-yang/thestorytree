class Topic < ActiveRecord::Base

  has_many :articles
  has_many :article_likes
  belongs_to :user
  accepts_nested_attributes_for :articles
end
