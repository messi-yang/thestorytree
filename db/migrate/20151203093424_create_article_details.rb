class CreateArticleDetails < ActiveRecord::Migration
  def change
    create_table :article_details do |t|
      t.integer :article_id
      t.text :content

      t.timestamps null: false
    end
  end
end
