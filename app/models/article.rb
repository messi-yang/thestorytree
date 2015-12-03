class Article < ActiveRecord::Base

  belongs_to :topic
  belongs_to :user
  has_one :article_detail
end
