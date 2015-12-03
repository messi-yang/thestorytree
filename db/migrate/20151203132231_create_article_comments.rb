class CreateArticleComments < ActiveRecord::Migration
  def change
    create_table :article_comments do |t|
      t.integer :article_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
