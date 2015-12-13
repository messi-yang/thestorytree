class MergeArticleDetailAndArticle < ActiveRecord::Migration
  def change
    drop_table(:article_details)
    add_column(:articles,:content,:text)
    rename_column(:topics,:private,:privacy)
    drop_table(:article_comment_details)
    add_column(:article_comments,:content,:text)
  end
end
