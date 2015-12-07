class ArticleCommentDetail < ActiveRecord::Base

  belongs_to :article_comment
  belongs_to :user

end
