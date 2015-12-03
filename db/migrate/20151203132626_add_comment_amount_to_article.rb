class AddCommentAmountToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :comment_amount, :integer
  end
end
