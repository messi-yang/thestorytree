class CreateArticleCommentDetails < ActiveRecord::Migration
  def change
    create_table :article_comment_details do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
