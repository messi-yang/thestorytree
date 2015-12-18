class AddArticleAmountToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :article_amount , :integer
    remove_column :topics, :likes , :integer
    remove_column :topics, :comment_amount , :integer
  end
end
