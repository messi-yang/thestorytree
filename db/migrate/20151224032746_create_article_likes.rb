class CreateArticleLikes < ActiveRecord::Migration
  def change
    create_table :article_likes do |t|
      t.integer :article_id
      t.integer :user_id
    end
  end
end
